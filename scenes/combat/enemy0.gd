class_name Enemy0
extends CharacterBody3D

# PROPERTIES

const SPEED = 5.0

@export var damage_val: int = 10
@export var direction: Vector3 = Vector3(0, 0, 1)

var is_turning: bool = false


# FUNCTIONS

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	# process gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# movement
	velocity.x = SPEED * direction.x
	velocity.z = SPEED * direction.z
	
	move_and_slide()
	
	if is_on_wall() and not is_turning:
		_turn_around()


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
