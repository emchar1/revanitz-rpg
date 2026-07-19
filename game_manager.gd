extends Node3D

var player = null

func _ready() -> void:
	QuestManager.quest_completed.connect(weapon_get)
	pass

func update_health(entity : CharacterBody3D, health_val : float):
	if entity.is_in_group("player"):
		$CanvasLayer/HUD/HealthBar.value = health_val

func death(entity : CharacterBody3D):
	if entity.is_in_group("player"):
		$CanvasLayer/DeathScreen.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	

		
func respawn_player():
	player.hurtbox.hp = 100
	update_health(player, 100)
	player.global_position = Vector3(0,0,0)
	
func weapon_get(quest_title : String):
	if quest_title == "Find Weapon Parts":
		player.weapon.visible = true
		player.hitbox.monitoring = true
