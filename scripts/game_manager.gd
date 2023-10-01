extends Node2D

@onready var mouse_position_label = $MousePositionLabel
@onready var mouse_pos = get_global_mouse_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	mouse_position_label.text = "Mouse X: %d, Y: %d" % [mouse_pos.x, mouse_pos.y] 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = get_global_mouse_position()
	mouse_position_label.text = "Mouse X: %d, Y: %d" % [mouse_pos.x, mouse_pos.y]
	
	if Input.is_action_pressed("exit"):
		get_tree().quit()
