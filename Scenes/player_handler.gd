extends Node2D

const PLAYER_PREFAB = preload("res://Entities/player/player.tscn")
@onready var player = $Player
signal clear_sauce

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.death.connect(spawn_player)
	var children = get_parent().get_children()
	for i in children.size():
		var child = children[i]
		if(child.has_method("reactivate_sauce")):
			clear_sauce.connect(child.reactivate_sauce)
		
	
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
