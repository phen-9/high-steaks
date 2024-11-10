extends CharacterBody2D

var move_direction : int
var vertical_direction : int
var is_saucy := false
var can_wall := true


@export var jump_strength : int
@export var hop_strength : int
@export var side_jump_strength : int

@export var ground_speed : int
@export var air_speed : int
@export var slide_speed : int
@export var dash_decay : int
@export var gravity : int
@export var terminal_velocity : int

var input_velocity : Vector2
var instant_velocity : Vector2

@export var label : Label
@export var state_machine : StateMachine
@export var sprite : Sprite2D

func _ready() -> void:
	
	pass

func _process(delta: float) -> void:
	if(can_wall):
		label.text = "can wall"
	else:
		label.text = "L bozoa "
		
	move_direction =  Input.get_axis("move_left","move_right")
	vertical_direction = Input.get_axis("move_up","move_down")
	if(move_direction < 0):
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	pass

func _physics_process(delta: float) -> void:
	velocity.x = input_velocity.x + instant_velocity.x
	velocity.y = input_velocity.y + instant_velocity.y
	move_and_slide()
	pass

func reset_velocity():
	input_velocity = Vector2(0,0)
	instant_velocity = Vector2(0,0)

func die():
	queue_free()

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if(area.has_method("endgame_yourself")):
		die()
