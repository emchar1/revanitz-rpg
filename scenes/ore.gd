extends Node3D

@export var obj_name = "Ore"
@export var obj_num = 5
signal obj_get(str : String)

func _ready() -> void:
	obj_get.connect(QuestManager.item_get)

func interact():
	if QuestManager.quest != null:
		if QuestManager.quest.object != obj_name:
			return
		obj_get.emit(self)	
		obj_num -= 1
		if obj_num <= 0:
			queue_free()
		print("got item")
