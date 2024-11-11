extends Node2D

@export var follow_speed := 30
@onready var knife_body = $KnifeBody
@onready var sprite = $KnifeBody/Sprite2D
@onready var search_area = $SearchArea
@onready var timer = $Timer
@onready var return_timer = $ReturnTimer

# 0 for wait, 1 for murder, 2 for return
var return_y

func _ready():
	return_y = knife_body.global_position.y
	
func _process(delta : float):
	pass

func _physics_process(_delta : float):
	knife_body.move_and_slide()
