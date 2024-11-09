extends CharacterBody2D

@export var speed = 50
var horizontal_direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	horizontal_direction = Input.get_axis("move_left","move_right")
	velocity.x = speed * horizontal_direction
	
	move_and_slide()

func jump() -> void:
	
	pass
