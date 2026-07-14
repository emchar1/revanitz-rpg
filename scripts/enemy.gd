class_name Enemy
extends CharacterBody3D

@onready var hurtbox : Hurtbox = $Hurtbox

func _ready():
	hurtbox.entity_dead.connect(death)
	add_to_group("enemies")
	
func death(entity):
	queue_free()
