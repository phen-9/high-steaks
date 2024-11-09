extends State
class_name GroundJump

@export var player : CharacterBody2D

func Enter():
	if(player.vertical_direction == 0):
		player.instant_velocity.y -= player.hop_strength
	elif(player.vertical_direction < 0):
		player.instant_velocity.y -= player.jump_strength
	player.instant_velocity.x += player.side_jump_strength * player.move_direction


func Physics_Update(_delta : float):
	
	Transitioned.emit(self,"inair")
	pass
