extends Node3D

@onready var label = %Label


var quest : Quest:
	set(value):
		quest = value
		%Label.text = value.title
		
			
func mob_slain(enemy):
	if quest != null:
		if quest.objective == "Kill" and quest.object == enemy.entity_name:
			quest.num -= 1
	#print("mob quest")

func item_get(obj):
	if quest != null:
		if quest.objective == "Fetch" and quest.object == obj.obj_name:
			quest.num -= 1
		if quest.num <= 0:
			quest.status = "Complete"
			print(quest.status)
			%Label.text = ""
		print(quest.num)
