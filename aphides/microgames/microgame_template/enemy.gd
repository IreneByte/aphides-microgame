extends CharacterBody2D

@onready var original_sprite = $Aphide

func _ready():
	for i in range(5):
		var clone = original_sprite.duplicate()  # duplicate node
		clone.position = original_sprite.position + Vector2(randf()*100, randf()*100)
		clone.set_owner(get_tree().current_scene)  # important for the editor to recognize it
		get_parent().add_child(clone)
