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
	if dialogue.quest_check == true:
		if QuestManager.quest != null:
			if QuestManager.quest.objective != "Complete":
				DialogueManager.hide_dialogue()
				return
	DialogueManager.dialogue = dialogue	
	
func quest_check():
	if QuestManager.quest != null:
		if QuestManager.quest.objective != "Complete":
			DialogueManager.hide_dialogue()
