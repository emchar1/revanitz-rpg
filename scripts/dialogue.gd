extends Resource
class_name Dialogue
 
@export_category("Information")
@export var name : String
@export var dialogue : String

@export_category("Linking Dialogues")
@export var path_option : String
@export var options : Array[Dialogue]
@export var close_dialogue : bool
@export var repeat_dialogue : bool
@export var quest_check : bool

@export_category("Quest")
@export var quest : Quest
