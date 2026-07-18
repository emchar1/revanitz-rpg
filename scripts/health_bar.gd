extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fill_style = StyleBoxFlat.new()
	fill_style.bg_color = Color.RED
	add_theme_stylebox_override("fill",fill_style)
