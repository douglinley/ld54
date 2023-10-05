extends Node2D

const Utils = preload("res://scripts/utils.gd")

var asteroid_scene : PackedScene = preload("res://Prefabs/asteroid_lg.tscn")

@onready var player = $Player
@onready var player_spawn = $PlayerSpawn
@onready var asteroid_spawn_container = $AsteroidSpawnerContainer
@onready var asteroid_container = $AsteroidContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer.start()
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


func get_random_marker(markers: Array) -> Marker2D:
	var rng = RandomNumberGenerator.new()
	return markers[rng.Randf_range(0, markers.size() - 1)]
	

func _on_spawn_timer_timeout():
	var marker = get_random_marker(get_asteroid_spawn_markers())
	var asteroid: Area2D = asteroid_scene.instantiate()
	asteroid.global_position = marker.global_position
	asteroid_container.add_child(asteroid)
	print("spawn!")
