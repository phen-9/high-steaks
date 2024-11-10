extends State

@export var player : CharacterBody2D
var x_velo
var y_velo
func Enter():
	player.sauce_count -= 1
	player.reset_velocity()
	x_velo = 1500
	y_velo = 1500
	var input_velo = abs(player.move_direction) + abs(player.vertical_direction)
	
	if(input_velo > 1):
		x_velo *= player.move_direction * (sqrt(2)/2)
		y_velo *= player.vertical_direction * (sqrt(2)/2)
	elif(input_velo == 0):
		x_velo *= player.forward
		y_velo *= 0
	else:
		x_velo *= player.move_direction
		y_velo *= player.vertical_direction
	
	
	pass

func Update(_delta : float):
	pass

func Physics_Update(_delta : float):
	x_velo /= 1.1
	y_velo /= 1.1
	player.instant_velocity.x = x_velo
	player.instant_velocity.y = y_velo
	if(abs(y_velo) < 200 && abs(x_velo) < 200):
		Transitioned.emit(self,"inair")
	if(player.is_on_wall() || player.is_on_floor() || player.is_on_ceiling()):
		Transitioned.emit(self,"inair")
