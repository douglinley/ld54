extends Node

class_name Utils

static func check_probability(probability):
	var rng = RandomNumberGenerator.new()
	var val = rng.randf_range(0, 100)
	return val < probability

