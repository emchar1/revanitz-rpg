class_name Hurtbox
extends Area3D

signal health_changed(entity : CharacterBody3D, health_val : float)
signal entity_dead(entity : CharacterBody3D)

@export var hp = 100

func _ready() -> void:
	entity_dead.connect(GameManager.death)
	health_changed.connect(GameManager.update_health)

func _process(delta: float) -> void:
	pass

func damage(damage_val: float):
	hp -= damage_val
	health_changed.emit(get_parent(), hp)
	if hp <= 0:
		owner.death()
	print(hp)
	
func hit():
	set_collision_layer_value(1,true)
