extends State
class_name InAir

@export var player : CharacterBody2D
@export var max_wall_uses : int

func Enter():
	pass

func Physics_Update(_delta: float):
	player.instant_velocity.y += player.gravity
	player.input_velocity.x = player.air_speed * player.move_direction
	var vert_dir = 0
	if(Input.is_action_pressed("move_down")):
		vert_dir = 1
	player.input_velocity.y += player.air_speed * vert_dir/8
	
	if(abs(player.instant_velocity.x) > 10):
		player.instant_velocity.x /= 1.1
	else:
		player.instant_velocity.x = 0
	
	if(player.sauce_count > 0 && Input.is_action_just_pressed("jump")):
		Transitioned.emit(self,"dash")
	
	if(player.is_on_floor()):
		Transitioned.emit(self,"onground")
	
	if(player.is_on_wall() && Input.is_action_pressed("hold_wall") && player.wall_uses < max_wall_uses):
		Transitioned.emit(self,"onwall")
	pass
	
