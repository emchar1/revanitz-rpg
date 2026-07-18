extends Area3D

var damage_val = 10
var entered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(hit)

func hit(area: Area3D):
	if not area is Hurtbox:
		return
	
	area.damage(damage_val)
	area.hit()
	print("hit")
