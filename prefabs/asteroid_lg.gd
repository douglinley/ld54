extends Asteroid

func _ready():
	init()
	
func _process(delta):
	run(delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	score.emit($ValueComponent.value)
	queue_free() # Replace with function body.
