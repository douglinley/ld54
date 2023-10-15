extends CharacterBody2D

@export var speed = 300.0
@onready var animation = $AnimationPlayer

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	animation.play("FlyStraight")


func _physics_process(delta):
	get_input()
	move_and_slide()


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
