extends CharacterBody2D

@onready var sprite = $Ladybug
const SPEED = 105

var count = 0
var last = 0

func _ready():
	count = 0
	last = 0

func _physics_process(delta):
	$"../Count".text = "Count: " + str(count)
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("keyboard_left"):
		direction.x = -1
		last = -1
	elif Input.is_action_pressed("keyboard_right"):
		direction.x = 1
		last = 1
	elif Input.is_action_pressed("keyboard_up"):
		direction.y = -1
	elif Input.is_action_pressed("keyboard_down"):
		direction.y = 1
		
	sprite.play("walk")
	if direction == Vector2.ZERO:
		sprite.play("idle")
		
	velocity = (direction * SPEED)
	
	sprite.flip_h = last >= 0
	
	move_and_slide()                 
