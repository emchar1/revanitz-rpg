extends Area3D

@export var damage_val = 10
var entered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(hit)

func hit(area: Area3D):	
	if area is not Hurtbox:
		print('eeeya')
		return
	area.damage(damage_val)
	area.hit()
	print("hit")
