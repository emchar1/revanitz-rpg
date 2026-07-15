extends Node3D

@export var next_button : PackedScene
@export var quest_button : PackedScene
@export var quest_check : PackedScene

var current_speaker = null

var dialogue : Dialogue:
	set(value):
		dialogue = value
		%Name.text = value.name
		%Dialogue.text = value.dialogue
		
		if current_speaker:
			current_speaker.dialogue = value
		reset_options()
		
		if value.quest:
			add_quest(value.quest)
		add_buttons(value.options)
		
		await get_tree().create_timer(0.5).timeout
		%Options.show()

func _ready():
	pass
	#dialogue = load("res://resources/NPCs/Dialogues/JakeTDATest/0.tres")

func reset_options():
	for child in %Options.get_children():
		child.queue_free()
	%Options.hide() 
	
func add_buttons(options):
	for option in options:
		var button = next_button.instantiate()
		button.dialogue = option
		%Options.add_child(button)
		
func add_quest(quest):
	print("hey")
	if QuestManager.quest == quest:
		return
	var button = quest_button.instantiate()
	button.quest = quest
	%Options.add_child(button)
	
func hide_dialogue():
	%UI.hide()

func show_dialogue():
	%UI.show()
