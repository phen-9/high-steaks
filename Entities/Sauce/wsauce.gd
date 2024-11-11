extends Area2D

var is_active = true
var x := 0
var sprite_offset 
@export var timer : Timer
@export var curve : Curve
@onready var sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	sprite_offset = curve.sample(timer.time_left)
	
	sprite.position.y = sprite_offset
	pass

func _on_body_entered(body: Node2D) -> void:
	if(is_active):
		if body.has_method("add_sauce"):
			body.add_sauce()
			is_active = false
			sprite.frame = 1

func reactivate_sauce():
	is_active = true
	sprite.frame =0
