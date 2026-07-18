extends Node3D

func _ready() -> void:
	pass

func update_health(entity : CharacterBody3D, health_val : float):
	if entity.is_in_group("player"):
		$CanvasLayer/HUD/HealthBar.value = health_val

func death(entity : CharacterBody3D):
	if entity.is_in_group("player"):
		$CanvasLayer/DeathScreen.visible = true
