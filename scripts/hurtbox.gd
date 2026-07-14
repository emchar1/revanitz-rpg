class_name Hurtbox
extends Area3D

signal health_changed(health_val)
signal entity_dead(entity : CharacterBody3D)

@export var hp = 100

func _process(delta: float) -> void:
	pass
	if hp <= 0:
		entity_dead.emit(get_parent())

func damage(damage_val: float):
	hp -= damage_val
	health_changed.emit(hp)
	print(hp)
	
func hit():
	set_collision_layer_value(1,true)
