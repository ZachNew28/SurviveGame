extends CharacterBody2D


@export var speed = 400

# Vector that tracks which way the player is facing for certain weapons
var facing_direction: Vector2 = Vector2.RIGHT


func _physics_process(delta: float) -> void:
	# Gets normalized direction input
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()

	if direction != Vector2.ZERO:
		$AnimatedSprite2D.play()
		facing_direction = direction.normalized()
	else:
		$AnimatedSprite2D.stop()

	# Only update facing on horizontal input, so moving straight up/down
	# keeps the last horizontal facing
	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x < 0