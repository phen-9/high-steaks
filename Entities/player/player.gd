extends CharacterBody2D

var move_direction : int
var vertical_direction : int
var forward : int
var sauce_count := 0

@export var jump_strength : int
@export var hop_strength : int
@export var side_jump_strength : int

@export var ground_speed : int
@export var air_speed : int
@export var slide_speed : int
@export var dash_decay : int
@export var gravity : int
@export var terminal_velocity : int
@export var sprite : Sprite2D

var input_velocity : Vector2
var instant_velocity : Vector2

var can_wall := true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	move_direction =  Input.get_axis("move_left","move_right")
	vertical_direction = Input.get_axis("move_up","move_down")
	if(move_direction != 0):
		forward = move_direction
	
	if(forward < 0):
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	

func _physics_process(delta: float) -> void:
	velocity.x = input_velocity.x + instant_velocity.x
	velocity.y = input_velocity.y + instant_velocity.y
	move_and_slide()
	

func reset_velocity():
	input_velocity = Vector2(0,0)
	instant_velocity = Vector2(0,0)
	
func add_sauce():
	sauce_count += 1
	

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if(area.has_method("endgame_yourself")):
		queue_free()
