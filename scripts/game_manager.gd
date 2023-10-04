extends Node2D

const Utils = preload("res://scripts/utils.gd")

@onready var player = $Player
@onready var player_spawn = $PlayerSpawn
@onready var asteroid_spawn_container = $AsteroidSpawnContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawn_markers : Array = get_asteroid_spawn_markers()
	player.global_position = player_spawn.global_position 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().quit()
		
func get_asteroid_spawn_markers() -> Array:
	var nodes := []
	if asteroid_spawn_container == null:
		return nodes
		
	for node in asteroid_spawn_container.get_children():
		nodes.push_back(node)
	return nodes
