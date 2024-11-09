extends State
class_name InAir

@export var player : CharacterBody2D

func Enter():
	pass

func Physics_Update(_delta: float):
	player.instant_velocity.y += player.gravity
	player.input_velocity.x = player.air_speed * player.move_direction
	
	if(player.is_on_floor()):
		Transitioned.emit(self,"onground")
	pass
	
