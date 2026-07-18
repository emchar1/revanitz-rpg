extends Button

var dialogue : Dialogue:
	set(value):
		dialogue = value
		text = dialogue.path_option

func _on_pressed() -> void:
	if dialogue.close_dialogue == true:
		DialogueManager.hide_dialogue()
	if dialogue.repeat_dialogue == true:
		return
	if QuestManager.quest.objective != "Complete":
		return
	DialogueManager.dialogue = dialogue	
