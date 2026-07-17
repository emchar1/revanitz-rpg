extends Node3D

# PROPERTIES

@onready var player = $Player
@onready var player_camera = $Player/Head/Camera3D
@onready var camera = $OverheadCamera
@onready var light = $DirectionalLight3D


# INIT FUNCTIONS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Setting sun, just because...
	var tween = create_tween()
	tween.tween_property(
		light,
		"rotation:x",
		-PI - PI / 16,
		20
	)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if not player:
		#return
	#
	#camera.current = player.is_on_floor()
	#player_camera.current = not player.is_on_floor()
	
	pass


# SIGNAL FUNCTIONS

# Called when player enters enemy pursuit detection area.
func _on_player_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		for node in get_tree().get_nodes_in_group("enemy"):
			var enemy = node as Enemy0
			if enemy:
				enemy.pursuit_mode = true


# Called when player leaves enemy pursuit detection area.
func _on_player_detector_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		for node in get_tree().get_nodes_in_group("enemy"):
			var enemy = node as Enemy0
			if enemy:
				enemy.pursuit_mode = false
