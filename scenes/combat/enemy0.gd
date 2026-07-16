class_name Enemy0
extends CharacterBody3D

# PROPERTIES



# FUNCTIONS

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_hitbox_area_entered(area: Area3D) -> void:
	if area is Hurtbox:
		print("You hurt: ", area.name)
	pass # Replace with function body.
