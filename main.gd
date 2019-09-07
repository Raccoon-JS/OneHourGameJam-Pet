extends Node

onready var dog_food = $status/dog
var food = preload("res://food.tscn")
var foods = ["bone","bowl","steak"]
var points = 0
var reload
var state


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$status/points.text = str(points)
	$background/title.modulate = colors.colors[0]
	$background/color_bg.color = colors.colors[1]
	$dog.modulate = colors.colors[2]
	$status/dog.modulate = colors.colors[3]
	$status/buttons.modulate = colors.colors[3]
	state = foods[int(rand_range(0,3))]
	dog_food.text = state
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
		
	
	if event.is_action_pressed("bone"):
		dog_food.text = foods[0]
		state = foods[0]
	elif event.is_action_pressed("bowl"):
		dog_food.text = foods[1]
		state = foods[1]
	elif event.is_action_pressed("steak"):
		dog_food.text = foods[2]
		state = foods[2]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if delta:
		if $foods.get_child_count() <= 0:
			var f = food.instance()
			f.global_position = $falling_pos.global_position
			$foods.add_child(f)
	pass

func _physics_process(delta):
	if delta:
		$status/points.text = str(points)

func _on_dog_body_entered(body):
	if body.state == state:
		points += 100
		global.more_speed += 50
		body.queue_free()
	else:
		global.default_speed = 100
		global.more_speed = 0
		reload = get_tree().reload_current_scene()
	pass # Replace with function body.
