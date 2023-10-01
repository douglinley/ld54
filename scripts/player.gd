extends CharacterBody2D

const SPEED = 200.0
var screen_size = Vector2(640, 480)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _physics_process(delta):
	var target_pos = get_viewport().get_mouse_position()
	
	target_pos.x = clamp(target_pos.x, 0, screen_size.x)
	target_pos.y = clamp(target_pos.y, 0, screen_size.y)
	
	position = target_pos
	
	print(target_pos)
