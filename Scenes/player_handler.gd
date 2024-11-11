extends Node2D

const PLAYER_PREFAB = preload("res://Entities/player/player.tscn")
@onready var player = $Player
var level = 0
signal clear_sauce

var levels : Dictionary = {0 : preload("res://Scenes/Levels/tutorial.tscn")}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.death.connect(spawn_player)
	var children = get_parent().get_children()
	for i in children.size():
		var child = children[i]
		if(child.has_method("reactivate_sauce")):
			clear_sauce.connect(child.reactivate_sauce)
		if(child.has_signal("finish_level")):
			child.finish_level.connect(finish_level)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player():
	print("respawing")
	var new_player = PLAYER_PREFAB.instantiate()
	new_player.death.connect(spawn_player)
	add_child(new_player)
	pass

func finish_level():
	print("YIPPEE")
	pass
