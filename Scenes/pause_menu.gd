extends Control

@export var pause_fx : AudioStream
@export var resume_fx : AudioStream

@export var menu_sfx : AudioStreamPlayer2D

func _ready() -> void:
	$Panel.visible = false

func resume():
	get_tree().paused = false

func pause():
	menu_sfx.set_stream(pause_fx)
	menu_sfx.play()
	get_tree().paused = true

func testEsc():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
		$Panel.visible = true
		print("Paused")
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()
		$Panel.visible = false
		print("Resumed")

func _on_resume_pressed() -> void:
	menu_sfx.set_stream(resume_fx)
	menu_sfx.play()
	resume()
	$Panel.visible = false


func _on_restart_pressed() -> void:
	$Panel.visible = false
	resume()
	#GlobVars.musicProgress = $music.get_playback_position()   
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	$Panel.visible = false
	get_tree().quit()


func _process(delta):
	testEsc()
