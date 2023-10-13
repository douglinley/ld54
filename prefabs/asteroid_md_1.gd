extends Asteroid


# Called when the node enters the scene tree for the first time.
func _ready():
	init() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	run(delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	score.emit($ValueComponent.value)
	queue_free() # Replace with function body.
