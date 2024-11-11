extends State

@onready var fork = $"../../ForkBody"
@onready var timer = $"../../ReturnTimer"
@onready var par = $"../.."

const kp = 10
var return_y

func Enter():
	return_y = par.return_y
	timer.start(1)

func Update(_delta : float):
	if(timer.is_stopped()):
		var error = return_y - fork.global_position.y
		fork.velocity.y = error * kp
		if(abs(fork.velocity.y) < 10):
			fork.velocity.y = 0
			Transitioned.emit(self,"wait")
	 
