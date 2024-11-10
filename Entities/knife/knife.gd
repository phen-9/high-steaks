extends CharacterBody2D

@export var follow_speed := 30

@onready var state_machine = $StateMachine

var follow_area

func _ready():
	for i in get_child_count():
		var child = get_child(i)
		if(child.is_class("Area2D")):
			follow_area = child

func _physics_process(_delta : float):
	move_and_slide()
	pass
