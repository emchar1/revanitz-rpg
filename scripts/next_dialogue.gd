extends Button

signal quest_complete()

var dialogue : Dialogue:
	set(value):
		dialogue = value
		text = dialogue.path_option

func _on_pressed() -> void:
	if dialogue.close_dialogue == true or dialogue.options.size() == 0:
		DialogueManager.hide_dialogue()
	if dialogue.repeat_dialogue == true:
		return
	if dialogue.quest_check == true:
		if QuestManager.quest != null:
			if QuestManager.quest.status != "Complete":
				DialogueManager.hide_dialogue()
				return
			else:
				quest_complete.emit()
	DialogueManager.dialogue = dialogue	
	
