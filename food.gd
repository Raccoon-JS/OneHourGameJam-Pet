extends KinematicBody2D
var foods = ["bone","bowl","steak"]
var speed
var state
var move = Vector2()
func _ready():
	randomize()
	speed = global.default_speed + global.more_speed
	state = foods[int(rand_range(0,3))]
	$food_name.text = state
	name = state
	modulate = colors.colors[2]
	set_physics_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(_delta):
	move = move_and_slide(Vector2(0,speed))
	pass