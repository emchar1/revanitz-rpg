extends Node3D

@export var obj_name = "Ore"
@export var ore_num = 5
signal ore_get(str : String)

func _ready() -> void:
	ore_get.connect(QuestManager.item_get)

func interact():
	ore_get.emit(self)
	#queue_free()
	print("got item")
