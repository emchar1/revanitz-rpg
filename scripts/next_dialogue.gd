extends Button

signal quest_complete(quest_name : String)

var dialogue : Dialogue:
	set(value):
		dialogue = value
		text = dialogue.path_option

func _on_pressed() -> void:
	if dialogue.close_dialogue == true or dialogue.options.size() == 0:
		#ProtoController.mouse_captured = true
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		DialogueManager.hide_dialogue()
	if dialogue.repeat_dialogue == true:
		return
	if dialogue.quest_check == true:
		if QuestManager.quest != null:
			if QuestManager.quest.status != "Complete":
				DialogueManager.hide_dialogue()
				return
			else:
				QuestManager.quest_complete()
	DialogueManager.dialogue = dialogue	
	
