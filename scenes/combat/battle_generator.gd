extends Node3D


@onready var player = $Player
@onready var player_camera = $Player/Head/Camera3D
@onready var camera = $OverheadCamera


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#camera.current = player.is_on_floor()
	#player_camera.current = not player.is_on_floor()
	pass
