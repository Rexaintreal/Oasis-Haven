extends CharacterBody2D

var speed: float = 900.0
var jump_velocity: float = -900.0
var score: int = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func update_score_label() -> void:
	var label = get_node_or_null("%Label")
	if label:
		label.text = "Score: " + str(score)
	else:
		print("LABEL NOT FOUND")

func _on_food_zone_body_entered(body: Node2D) -> void:
	var food_zone = get_node("../FoodZone")
	if food_zone.busy:
		return
	score += 1
	update_score_label()
	food_zone.trigger_pickup()
