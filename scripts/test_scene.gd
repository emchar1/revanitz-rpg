extends Node3D

@onready var boss_generator = $BossGenerator
@onready var audio_player = $Sounds/AudioStreamPlayer3D
const BOSS_THEME = preload("res://assets/sounds/mine/spiderboss.ogg")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	boss_generator.boss_area_entered.connect(_change_theme)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _change_theme():
	audio_player.stream = BOSS_THEME
	audio_player.play()
	pass
