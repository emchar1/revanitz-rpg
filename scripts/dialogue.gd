extends Resource
class_name Dialogue
 
@export_category("Information")
@export var name : String
@export var dialogue : String

@export_category("Linked List")
@export var path_option : String
@export var options: Array[Dialogue]
