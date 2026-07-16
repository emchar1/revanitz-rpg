extends Node

# PROPERTIES

var y_axis_multiplier: float = -1.0


# FUNCTIONS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Y-INVERT FUNCTIONS

func toggle_invert_y() -> void:
	y_axis_multiplier *= -1.0


func set_invert_y(enable: bool = false) -> void:
	y_axis_multiplier = -1.0 if enable else 1.0
