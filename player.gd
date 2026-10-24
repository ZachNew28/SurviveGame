extends CharacterBody2D


@export var speed = 400


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		# First time using this node type so make sure .normalized()
		# is actually needed
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	# TODO: Add code so that when going up and down, the current
	# sprite is based on the last horizontal direction input
