extends State
class_name GroundJump

@export var player : CharacterBody2D
@export var label : Label
@export var timer : Timer


func Enter():
	timer.start(.2)
	player.instant_velocity.y -= player.hop_strength
	player.instant_velocity.x += player.side_jump_strength * player.move_direction


func Physics_Update(_delta : float):
	label.text = "%f" % timer.time_left
	if(timer.time_left != 0 && Input.is_action_pressed("jump")):
		player.instant_velocity.y -= 4*timer.time_left
	else:
		Transitioned.emit(self,"inair")
	
	#player.instant_velocity.y += player.gravity
	player.input_velocity.x = player.air_speed * player.move_direction
	
	pass
