extends Node #It has to extend something, a simple Node is a good idea    
var musicProgress = 0.0 #By being at 0, it will always start at the beginning when you launch the game
var music = AudioStreamPlayer.new()
var song : AudioStream = preload("res://Assets/Sounds/Platformer.ogg")

func _ready() -> void:
	add_child(music)
	music.stream = song
	music.play(GlobVars.musicProgress)
	
func _process(delta: float) -> void:
	if(!music.playing):
		music.play(0.0)
	musicProgress = music.get_playback_position()
	pass