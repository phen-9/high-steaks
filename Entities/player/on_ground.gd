extends State
class_name OnGround

@export var player :CharacterBody2D

func Enter() -> void:
	player.can_wall = true
	player.sauce_count = 0
	
	var game = player.get_parent()
	for child in game.get_children():
		if(child.has_method("reactivate_sauce")):
			child.reactivate_sauce()
	pass

func Physics_Update(delta: float) -> void:
	player.reset_velocity()
	
	player.input_velocity.x = player.ground_speed * player.move_direction
	
	if(Input.is_action_just_pressed("jump")):
		Transitioned.emit(self,"groundjump")
	
	if(!player.is_on_floor()):
		Transitioned.emit(self,"inair")
