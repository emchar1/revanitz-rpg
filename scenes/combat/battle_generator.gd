extends Node3D

# PROPERTIES

@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var enemies: Array[Enemy0] = [
	$NavigationRegion3D/Enemies/Enemy0,
	$NavigationRegion3D/Enemies/Enemy1,
	$NavigationRegion3D/Enemies/Enemy2
]


# INIT FUNCTIONS

func _ready() -> void:
	for enemy in enemies:
		enemy.player = player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# SIGNAL FUNCTIONS

# Detects if player enters enemy zones.
func _on_player_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		for node in get_tree().get_nodes_in_group("enemy"):
			var enemy = node as Enemy0
			if enemy:
				enemy.can_pursue = true


# Detects if player exits enemy zones.
func _on_player_detector_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		for node in get_tree().get_nodes_in_group("enemy"):
			var enemy = node as Enemy0
			if enemy:
				enemy.can_pursue = false
