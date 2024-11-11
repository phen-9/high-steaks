extends Node2D


@onready var fork_body = $ForkBody


# 0 for wait, 1 for murder, 2 for return
var return_y

func _ready():
	return_y = fork_body.global_position.y
	
func _process(delta : float):
	pass

func _physics_process(_delta : float):
	fork_body.move_and_slide()
