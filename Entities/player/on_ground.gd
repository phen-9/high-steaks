extends State
class_name OnGround

@export var player :CharacterBody2D
@export var timer : Timer

@export var walk_sound : AudioStream
@export var player_sfx : AudioStreamPlayer2D

func Enter() -> void:
	player.wall_uses = 0
	player.sauce_count = 0
	
	var game = player.get_parent()
	for child in game.get_children():
		if(child.has_method("reactivate_sauce")):
			child.reactivate_sauce()
	pass

func Physics_Update(delta: float) -> void:
	player.reset_velocity()
	
	player.input_velocity.x = player.ground_speed * player.move_direction
	if(player.input_velocity.x != 0 && timer.is_stopped()):
		player_sfx.set_stream(walk_sound)
		player_sfx.pitch_scale = 1 + ((float)(randi() % 81 - 40) / 100)
		player_sfx.play()
		timer.start(.5)
	elif(player.input_velocity.x == 0):
		timer.stop()
	
	if(Input.is_action_just_pressed("jump")):
		Transitioned.emit(self,"groundjump")
	
	if(!player.is_on_floor()):
		Transitioned.emit(self,"inair")
