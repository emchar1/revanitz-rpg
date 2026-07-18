extends Area3D

var can_interact = false:
	set(value):
		can_interact = value
		%Label.visible = value
		print(can_interact)
		
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		can_interact = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		can_interact = false


func interaction():
	owner.interact()
	print(owner.name + " interacted.")
	
func _input(event):
	if event.is_action_pressed("interact") and can_interact == true:
		interaction()
