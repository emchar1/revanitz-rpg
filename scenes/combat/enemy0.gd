class_name Enemy0
extends CharacterBody3D

# PROPERTIES

@export var speed = 2.0
@export var damage_val: int = 10
@export var direction: Vector3 = Vector3(0, 0, 1)
@export var player_path: NodePath

@onready var nav_agent = $NavigationAgent3D
@onready var eyes = $Eyes

var player: Player = null
var is_turning: bool = false
var can_pursue: bool = false
var pursuit_mode: bool = false


# FUNCTIONS

func _ready() -> void:
	player = get_node(player_path)
	eyes.material_override = eyes.get_active_material(0).duplicate()


func _physics_process(delta: float) -> void:
	if not player:
		return
	
	# process gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if can_pursue and pursuit_mode:
		eyes.material_override.albedo_color = Color.RED
		
		# path-finding
		nav_agent.set_target_position(player.global_position)
		
		var next_nav_point = nav_agent.get_next_path_position()
		var path_dir = next_nav_point - global_position
		
		path_dir.y = 0
		path_dir = path_dir.normalized()
		
		velocity.x = path_dir.x * speed
		velocity.z = path_dir.z * speed
		
		# turn in direction of movement
		_face_direction(path_dir)
	else:
		eyes.material_override.albedo_color = Color.GREEN
		
		# movement - patrolling
		velocity.x = speed * direction.x
		velocity.z = speed * direction.z
		
		_face_direction(direction)
	
	move_and_slide()
	
	# This needs to come AFTER move and slide otherwise enemy bugs out on turn!
	if not can_pursue or not pursuit_mode:
		# turn around if patrolling
		if is_on_wall() and not is_turning:
			_turn_around()


# Right the enemy facing direction
func _face_direction(dir: Vector3):
	if dir.length_squared() > 0.0:
		look_at(global_position + dir, Vector3.UP)


# Helper function used for patrolling
func _turn_around():
	var last_direction := direction
	direction = Vector3.ZERO
	
	is_turning = true
	
	var turn_tween = create_tween()
	turn_tween.tween_property(
		self,
		"rotation",
		Vector3(0, PI, 0),
		0.6
	).as_relative()
	
	await turn_tween.finished
	
	direction.x = last_direction.x * -1
	direction.z = last_direction.z * -1
	
	is_turning = false


# SIGNAL FUNCTIONS

func _on_hitbox_area_entered(area: Area3D) -> void:
	if area is Hurtbox:
		area.damage(damage_val)
		area.hit()
		print("hit")


func _on_vision_cone_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		print("enter")
		pursuit_mode = true


func _on_vision_cone_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		print("exit")
		pursuit_mode = false
