extends Button



func _on_pressed() -> void:
	GameManager.respawn_player()
	$"..".visible = false
