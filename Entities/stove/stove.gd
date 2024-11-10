extends AnimatableBody2D

@onready var sprite = $Sprite
@onready var timer = $Timer
const HITBOX_PREFAB = preload("res://Entities/stove/hitbox.tscn")

@export var tick : AudioStreamPlayer2D
@export var fwoosh : AudioStreamPlayer2D
@export var duration := 3

func _ready() -> void:
	sprite.animation = "still"
	timer.start(duration)
	pass

func _process(delta: float) -> void:
	if(!tick.playing):
		tick.play()
	pass

func _on_timer_timeout() -> void:
	fwoosh.play()
	sprite.animation = "blast"
	sprite.play()
	var hitbox = HITBOX_PREFAB.instantiate()
	add_child(hitbox)
	timer.start(duration)

func _on_sprite_animation_finished() -> void:
	sprite.animation = "still"
