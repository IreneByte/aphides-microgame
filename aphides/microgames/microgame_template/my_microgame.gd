extends Microgame

@onready var spawners: Node2D = $Spawners

var enemy = load("res://microgames/microgame_template/Scenes/enemy.tscn")

func _ready() -> void:
	super()


func _process(delta: float) -> void:
	
	var we_won := false
	var we_lost := false
	
	
	if we_won:
		win_game.emit()
	
	if we_lost:
		lose_game.emit()


func _get_random_child(parent_node):
	var random_id = randi() % spawners.get_child_count()
	return parent_node.get_child(random_id)

func _on_spawn_timer_timeout() -> void:
	var spawn_point = _get_random_child(spawners).global_position
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = spawn_point
	enemy_instance.player = $Player
	$Enemies.add_child(enemy_instance)
