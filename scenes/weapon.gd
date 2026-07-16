extends Area3D

var damage_val = 10
var entered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(hit)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func hit(area: Area3D):
	if not area is Hurtbox:
		return
	
	area.damage(damage_val)
	area.hit()
	print("hit")
