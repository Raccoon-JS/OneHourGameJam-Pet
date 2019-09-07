extends Node

var default_speed 
var more_speed

func _ready():
	default_speed = 100
	more_speed = 0
	pass

func reset():
	more_speed = 0