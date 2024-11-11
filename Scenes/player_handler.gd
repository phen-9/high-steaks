extends Node2D

const PLAYER_PREFAB = preload("res://Entities/player/player.tscn")
@onready var player = $Player
var spawnpoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnpoint = global_position
	player.death.connect(spawn_player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player():
	print("respawing")
	global_position = spawnpoint
	var new_player = PLAYER_PREFAB.instantiate()
	add_child(new_player)
	pass
