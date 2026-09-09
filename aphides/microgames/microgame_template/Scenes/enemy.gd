extends Area2D

@onready var sprite = $Aphide
var player : CharacterBody2D

const SPEED = 50.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if player != null:
		var direction = player.global_position - global_position
		
		if direction.x > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
			
		if abs(direction.x) > abs(direction.y):
			global_position.x = move_toward(global_position.x, player.global_position.x, delta * SPEED)
		else:
			global_position.y = move_toward(global_position.y, player.global_position.y, delta * SPEED)
		
		sprite.play("walk")
		if direction == Vector2.ZERO:
			sprite.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):		
		player.count += 1
		queue_free()
