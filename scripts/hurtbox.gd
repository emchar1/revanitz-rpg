class_name Hurtbox
extends Area3D

signal health_changed(entity : CharacterBody3D, health_val : float)
signal entity_dead(entity : CharacterBody3D)

@export var hp = 100.0

func _ready() -> void:
	entity_dead.connect(GameManager.death)
	health_changed.connect(GameManager.update_health)

func _process(delta: float) -> void:
	pass

func damage(damage_val: float):
	var parent = get_parent()
	hp -= damage_val
	health_changed.emit(parent, hp)
	if hp <= 0:
		get_parent().death()
	print(hp)


func hit():
	pass
	#set_collision_layer_value(1,true)
