class_name Enemy
extends CharacterBody3D

signal enemy_dead(entity)

@export var entity_name : String = "Enemy"
@onready var hurtbox : Hurtbox = $Hurtbox

func _ready():
	enemy_dead.connect(QuestManager.mob_slain)
	add_to_group("enemies")
	
func death():
	enemy_dead.emit(self)
	queue_free()
