extends Node3D

# PROPERTIES

@export var timer_min = 0.5
@export var timer_max = 1.0

@onready var water_markers = [
	$Marker3D,
	$Marker3D2,
	$Marker3D3,
	$Marker3D4,
	$Marker3D5,
	$Marker3D6,
	$Marker3D7,
	$Marker3D8,
]

var drip_sounds: Array[AudioData.AudioKey] = [
	AudioData.AudioKey.DRIP0,
	AudioData.AudioKey.DRIP1,
	AudioData.AudioKey.DRIP2,
	AudioData.AudioKey.DRIP3,
	AudioData.AudioKey.DRIP4
]

var drip_timer: Timer
var last_drip: int


# INIT FUNCTIONS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drip_timer = Timer.new()
	drip_timer.timeout.connect(_timer_timeout)
	add_child(drip_timer)
	
	_schedule_drip()


# DRIP FUNCTIONS

func _schedule_drip():
	drip_timer.wait_time = randf_range(timer_min, timer_max)
	drip_timer.start()


func _timer_timeout():
	var current_drip = drip_sounds.pick_random()
	
	while current_drip == last_drip:
		current_drip = drip_sounds.pick_random()
	
	last_drip = current_drip
	
	AudioManager.play(
		current_drip, 
		randf_range(-20.0, -10.0), 
		water_markers.pick_random().position,
		true
	)
	
	_schedule_drip()
