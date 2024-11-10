extends CharacterBody2D

@export var follow_speed := 30
@onready var state_machine = $StateMachine

var follow_area
var start_position

func _ready():
	start_position = global_position
	for i in get_child_count():
		var child = get_child(i)
		if(child.is_class("Area2D")):
			print("FOLLOW AREA FOUND")
			follow_area = child

func _physics_process(_delta : float):
	move_and_slide()
	pass
