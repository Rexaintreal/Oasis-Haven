extends Area2D

var busy: bool = false

func trigger_pickup() -> void:
	if busy:
		return
	busy = true
	monitoring = false
	visible = false
	await get_tree().create_timer(1.5).timeout
	global_position.x += randf_range(-300, 300)
	visible = true
	monitoring = true
	busy = false
