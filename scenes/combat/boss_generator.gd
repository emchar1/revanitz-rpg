extends Node3D

# PROPERTIES

signal boss_area_entered

@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var boss = $EnemyBoss


# INIT FUNCTIONS

func _ready() -> void:
	boss.player = player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# SIGNAL FUNCTIONS

# Detects if player enters enemy zones.
func _on_player_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		for node in get_tree().get_nodes_in_group("enemy"):
			var enemy = node as EnemyBoss
			if enemy:
				enemy.can_pursue = true
				boss_area_entered.emit()


# Detects if player exits enemy zones.
func _on_player_detector_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		for node in get_tree().get_nodes_in_group("enemy"):
			var enemy = node as EnemyBoss
			if enemy:
				enemy.can_pursue = false
