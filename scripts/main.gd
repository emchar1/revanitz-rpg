extends Node3D

@onready var hurtbox : Hurtbox = $Baseplate/ProtoController/Hurtbox

func _ready() -> void:
	hurtbox.health_changed.connect(update_health)
	hurtbox.entity_dead.connect(death)

func update_health(health_val : float):
	$CanvasLayer/HUD/HealthBar.value = health_val

func death(entity : CharacterBody3D):
	
	if entity.is_in_group("player"):
		$CanvasLayer/DeathScreen.visible = true
