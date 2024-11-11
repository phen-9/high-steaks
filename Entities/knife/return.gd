extends State

@onready var knife = $"../../KnifeBody"
@onready var timer = $"../../ReturnTimer"
@onready var par = $"../.."

const kp = 10
var return_y

func Enter():
	return_y = par.return_y
	timer.start(1)

func Update(_delta : float):
	if(timer.is_stopped()):
		var error = return_y - knife.global_position.y
		knife.velocity.y = error * kp
		if(abs(knife.velocity.y) < 10):
			knife.velocity.y = 0
			Transitioned.emit(self,"wait")
	 
