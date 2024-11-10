extends State
class_name OnGround

@export var player : CharacterBody2D
@export var walk_sfx : AudioStreamPlayer2D
@export var sfx_timer : Timer

func Enter() -> void:
	player.can_wall = true
	player.sauce_count = 0
	
	var game = player.get_parent()
	for child in game.get_children():
		if(child.has_method("reactivate_sauce")):
			child.reactivate_sauce()
	pass

func Physics_Update(delta: float) -> void:
	player.reset_velocity()
	if(abs(player.move_direction) != 0):
		player.sprite.animation = "walk"
		player.sprite.play()
	else:
		player.sprite.animation = "idle"
	
	player.input_velocity.x = player.ground_speed * player.move_direction
	if(player.input_velocity.x != 0 && sfx_timer.is_stopped()):
		walk_sfx.pitch_scale = 1 + (float)(randi() % 81 - 40) / 100
		walk_sfx.play()
		sfx_timer.start(.25)
	elif(!sfx_timer.is_stopped() && player.input_velocity.x == 0):
		sfx_timer.stop()
	
	
	if(Input.is_action_just_pressed("jump")):
		Transitioned.emit(self,"groundjump")
	
	if(!player.is_on_floor()):
		Transitioned.emit(self,"inair")
