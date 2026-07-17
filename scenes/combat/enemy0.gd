class_name Enemy0
extends CharacterBody3D

# PROPERTIES

const SPEED = 2.0

@export var damage_val: int = 10
@export var direction: Vector3 = Vector3(0, 0, 1)
@export var player_path: NodePath

@onready var nav_agent = $NavigationAgent3D

var player: Player = null
var is_turning: bool = false


# FUNCTIONS

func _ready() -> void:
	player = get_node(player_path)


func _physics_process(delta: float) -> void:
	if not player:
		return
	
	# process gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	
	## movement - patrolling
	#velocity.x = SPEED * direction.x
	#velocity.z = SPEED * direction.z
	
	
	
	# path-finding
	nav_agent.set_target_position(player.global_position)
	
	var next_nav_point = nav_agent.get_next_path_position()
	var path_dir = next_nav_point - global_position
	
	path_dir.y = 0
	path_dir = path_dir.normalized()
	
	velocity.x = path_dir.x * SPEED
	velocity.z = path_dir.z * SPEED
	
	# turn in direction of movement
	look_at(player.global_position, Vector3.UP)
	
	move_and_slide()
	
	
	
	## turn around if patrolling
	#if is_on_wall() and not is_turning:
		#_turn_around()


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


func _on_hitbox_area_entered(area: Area3D) -> void:
	if area is Hurtbox:
		area.damage(damage_val)
		area.hit()
		print("hit")
