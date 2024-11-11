extends Node #It has to extend something, a simple Node is a good idea    
var musicProgress = 0.0 #By being at 0, it will always start at the beginning when you launch the game
var music = AudioStreamPlayer.new()
var song : AudioStream = preload("res://Assets/Sounds/Platformer.ogg")
var time_start : int

func _ready() -> void:
	time_start = Time.get_ticks_msec()
	music.autoplay = false
	add_child(music)
	music.stream = song
	music.play(GlobVars.musicProgress)
	
func _process(delta: float) -> void:
	if(!music.playing):
		pass
		music.play(0.0)
	musicProgress = music.get_playback_position()
	pass
