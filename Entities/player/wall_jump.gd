extends State
class_name WallJump

@export var player : CharacterBody2D
@export var timer : Timer
@export var sounds : AudioStreamPlayer2D
@export var jump_sfx : AudioStreamPlayer2D

func Enter():
	jump_sfx.play()
	player.can_wall = false
	timer.start(.2)
	player.instant_velocity.y -= player.hop_strength
	player.instant_velocity.x += player.side_jump_strength * player.get_wall_normal().x


func Physics_Update(_delta : float):
	if(timer.time_left != 0 && Input.is_action_pressed("jump")):
		player.instant_velocity.y -= 4 * timer.time_left
		player.instant_velocity.x *= .8
	else:
		Transitioned.emit(self,"inair")
	
	if(player.is_on_ceiling()):
		player.reset_velocity()
		sounds.play()
		Transitioned.emit(self,"inair")
	
	player.input_velocity.x = player.air_speed * player.move_direction
	
	pass
