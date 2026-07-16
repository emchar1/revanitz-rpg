class_name Enemy0
extends CharacterBody3D

# PROPERTIES

@export var damage_val: int = 10


# FUNCTIONS

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	# process gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()


func _on_hitbox_area_entered(area: Area3D) -> void:
	if area is Hurtbox:
		area.damage(damage_val)
		area.hit()
		print("hit")
