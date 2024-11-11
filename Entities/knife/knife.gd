extends Node2D


@onready var knife_body = $KnifeBody


# 0 for wait, 1 for murder, 2 for return
var return_y

func _ready():
	return_y = knife_body.global_position.y
	
func _process(delta : float):
	pass

func _physics_process(_delta : float):
	knife_body.move_and_slide()
