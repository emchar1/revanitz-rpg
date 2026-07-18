extends Button


var quest : Quest:
	set(value):
		quest = value
		text = value.title + " [QUEST]"
		


func _on_pressed() -> void:
	print("quest")
	QuestManager.quest = quest
	DialogueManager.dialogue = quest.next_dialogue
