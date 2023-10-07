extends Area2D

@onready var x_speed_min := -10
@onready var y_speed_min := 10

@onready var x_speed_max := 200
@onready var y_speed_max := 400

@onready var x_speed : int
@onready var y_speed : int

func _ready():
	var rng = RandomNumberGenerator.new()
	x_speed = rng.randf_range(x_speed_min, x_speed_max)
	y_speed = rng.randf_range(y_speed_min, y_speed_max)
	pass


func _physics_process(delta):
	position.x += x_speed * delta
	position.y += y_speed * delta
