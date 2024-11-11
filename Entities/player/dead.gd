extends State

@export var death_sfx : AudioStreamPlayer2D
@export var player : CharacterBody2D
@export var collision : CollisionShape2D
@export var hurtbox : Area2D
@export var sprite : AnimatedSprite2D

var bloop = 1

func Enter() -> void:
	sprite.z_index = 2
	sprite.animation = "jump"
	sprite.frame = 1
	player.reset_velocity()
	collision.set_deferred("disabled", true)
	player.instant_velocity.y = -400
	hurtbox.queue_free()
	disconnect_camera()
	death_sfx.play()

func Physics_Update(_delta : float):
	player.instant_velocity.y += player.gravity
	bloop -= _delta
	if(bloop <= 0):
		print("Player removed")
		player.emit_signal("death")
		player.camera.queue_free()
		player.queue_free()
	
func disconnect_camera():
	player.camera.reparent(player.get_parent())
