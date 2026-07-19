extends Node3D

@onready var enemy:PhysicalBoneSimulator3D = get_node("Esqueleto/Skeleton3D/PhysicalBoneSimulator3D")
var active: bool = false

func _unhandled_input(event: InputEvent) -> void:
	
	# Change the condition
	if event.is_action_pressed("ui_accept"):
		
		active = !active
		
		# it should only be activated when the enemy dies
		# I recommend set the animation to idle before you activate the ragdoll 
		if active:
			enemy.physical_bones_start_simulation()
