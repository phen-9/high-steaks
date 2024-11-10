extends AnimatableBody2D

@onready var sprite = $Sprite
@onready var timer = $Timer
@onready var particle = $GPUParticles2D
@export var tick_curve : Curve
@export var particle_curve : Curve

const HITBOX_PREFAB = preload("res://Entities/stove/hitbox.tscn")

@export var tick : AudioStreamPlayer2D
@export var fwoosh : AudioStreamPlayer2D
@export var duration := 3
@export var tick_duration := 1

func _ready() -> void:
	sprite.animation = "still"
	timer.start(duration)
	pass

func _process(delta: float) -> void:
	tick.pitch_scale = 1+ tick_curve.sample(timer.time_left / tick_duration)
	if(!tick.playing && timer.time_left < tick_duration):
		tick.play()
	if(timer.time_left < tick_duration):
		if(!particle.emitting):
			particle.emitting = true
		particle.amount_ratio = particle_curve.sample(timer.time_left / tick_duration)
	else:
		particle.emitting = false
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
