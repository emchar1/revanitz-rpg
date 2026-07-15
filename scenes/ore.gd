extends Node3D

func interact():
	if QuestManager.quest != null:
		QuestManager.quest.objective = "Complete"
	print("got item")
