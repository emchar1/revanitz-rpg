class_name NPC
extends CharacterBody3D

@export var dialogue : Dialogue

func _ready() -> void:
	add_to_group("npcs")

func interact():
	DialogueManager.dialogue = dialogue
	DialogueManager.current_speaker = self
	DialogueManager.show_dialogue()
