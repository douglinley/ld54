extends Node2D

const Utils = preload("res://scripts/utils.gd")

var asteroid_lg_scene : PackedScene = preload("res://Prefabs/asteroid_lg.tscn")
var asteroid_md1_scene : PackedScene = preload("res://Prefabs/asteroid_md_1.tscn")
var asteroid_ms2_scene : PackedScene = preload("res://prefabs/asteroid_md_2.tscn")
var asteroid_sm_scene : PackedScene = preload("res://Prefabs/asteroid_sm.tscn")

var asteroid_scenes: Array = [
	asteroid_lg_scene, 
	asteroid_md1_scene, 
	asteroid_ms2_scene, 
	asteroid_sm_scene]

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
	return markers[rng.randf_range(0, markers.size())]
	
func get_random_asteroid_scene(scenes: Array) -> PackedScene:
	var rng = RandomNumberGenerator.new()
	return scenes[rng.randf_range(0, scenes.size())]
	

func _on_spawn_timer_timeout():
	# 10% change to spawn
	if !Utils.check_probability(100):
		print("no spawn")
		return
		
	var marker = get_random_marker(get_asteroid_spawn_markers())
	var asteroid_scene = get_random_asteroid_scene(asteroid_scenes)
	
	var asteroid: Area2D = asteroid_scene.instantiate()
	asteroid.global_position = marker.global_position
	asteroid_container.add_child(asteroid)
	print("spawn!")
