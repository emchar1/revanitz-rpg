extends Node

# PROPERTIES

var players: Dictionary[int, Array] = {}
var music_timer: Timer
var current_music := AudioData.Music.NONE


# FUNCTIONS

func _ready() -> void:
	prime_audio()


# Plays audio for sound (int) at volume, position, and (optional) pitch.
func play(
	sound: AudioData.AudioKey,
	volume := 0.0,
	position := Vector3.ZERO,
	vary_pitch := false
	) -> void:
	
	# guard statement
	if not AudioData.sounds.has(sound):
		push_warning("Sound not found: %s" % str(sound))
		return
	
	var audio_key = AudioData.sounds[sound]
	var player = AudioStreamPlayer3D.new()
	player.stream = audio_key["stream"].duplicate()
	
	match audio_key["type"]:
		AudioData.Type.SOUND: player.bus = "SFX"
		AudioData.Type.MUSIC: player.bus = "Music"
	
	player.volume_db = volume
	
	# tiny variation in pitch for variety
	if vary_pitch:
		player.pitch_scale = randf_range(0.8, 1.2)
	
	# pan position in world space
	player.position = position
	
	if audio_key["type"] == AudioData.Type.MUSIC:
		player.stream.loop = true
	else:
		player.finished.connect(func():
			if players.has(sound):
				players[sound].erase(player)
				
			player.queue_free()
		)
	
	# set the players dictionary
	if not players.has(sound):
		players[sound] = []
	
	players[sound].append(player)
	
	add_child(player)
	player.play()


# Stops the sound audio.
func stop(sound: AudioData.AudioKey, fade: float = -1):
	if not players.has(sound):
		return
	
	for player in players[sound]:
		if fade <= -1:
			_release_player(player)
		else:
			var fade_tween = create_tween()
			fade_tween.tween_property(player, "volume_db", -80.0, fade)
			fade_tween.tween_callback(_release_player.bind(player))
	
	players.erase(sound)


# Stops and free's the playing player.
func _release_player(player: AudioStreamPlayer3D):
	player.stop()
	player.queue_free()


# Plays sound of type: Music.
func play_music(
	music: AudioData.Music, 
	volume: float = 0.0,
	position: Vector3 = Vector3.ZERO,
	vary_pitch: bool = false
	):
	var dict = AudioData.music_map.get(music)
	
	if dict == null:
		return
	
	current_music = music
	
	if music_timer:
		music_timer.stop()
		music_timer.queue_free()
		music_timer = null
	
	music_timer = Timer.new()
	
	add_child(music_timer)
	
	var timer = music_timer
	
	timer.timeout.connect(func():
		play(dict["music"], volume, position, vary_pitch)
		timer.queue_free()
		
		if music_timer == timer:
			music_timer = null
	)
	
	timer.start()


# Stops the music audio.
func stop_music(music: AudioData.Music, fade: float = -1):
	var dict = AudioData.music_map.get(music)
	
	if dict == null:
		return
	
	current_music = AudioData.Music.NONE
	
	if music_timer:
		music_timer.stop()
		music_timer.queue_free()
		music_timer = null
	
	stop(dict["music"], fade)


# Stops any and all music playing. Nuclear option. Clean slate. Tabula rasa.
func stop_all_music():
	for music in AudioData.Music.values():
		stop_music(music)


# Checks if any music is currently playing.
func is_any_music_playing() -> bool:
	for id in players.keys():
		var type = AudioData.sounds[id]["type"]
		var is_music: bool = type == AudioData.Type.MUSIC
		
		if is_music:
			return true
	
	return false


# Checks if specific music is playing.
func is_music_playing(music: AudioData.Music) -> bool:
	return current_music == music


# Checks if specific sound (or music) is playing.
func is_playing(sound: AudioData.AudioKey) -> bool:
	for bus_player in players.values():
		for player in bus_player:
			var stream = AudioData.sounds[sound]["stream"]
			
			if player.playing and player.stream == stream:
				return true
	
	return false


# Primes all looped music (prevents game loop stuttering on Web builds).
# Does this by playing sound for one game frame.
func prime_audio():
	for sound in AudioData.sounds.keys():
		if AudioData.sounds[sound]["type"] == AudioData.Type.MUSIC:
			var muted_volume: float = -80.0
			
			play(sound, muted_volume)
			await get_tree().process_frame
			stop(sound)
