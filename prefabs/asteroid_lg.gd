extends Area2D

@onready var speed := 200


func _ready():
	pass


func _physics_process(delta):
	position.y += speed * delta
