class_name Hurtbox
extends Area3D

@export var health = 100

func _process(delta: float) -> void:
	if health <= 0:
		get_parent().queue_free()

func damage(damage_val: float):
	health -= damage_val
	print(health)
	
func hit():
	set_collision_layer_value(1,true)
