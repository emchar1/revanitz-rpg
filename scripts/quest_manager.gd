extends Node3D


var quest : Quest:
	set(value):
		quest = value
		if value.objective == "Fetch":
			%Label.text = "Find " + value.title
