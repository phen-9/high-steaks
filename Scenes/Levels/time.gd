extends Label

var end_time : int
var speedrun_time : int
var time_mill : int
var time_seconds : int
var time_minutes : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end_time = Time.get_ticks_msec()
	speedrun_time = end_time - GlobVars.time_start
	time_mill = (speedrun_time % 1000)
	time_seconds = (speedrun_time / 1000) % 60
	time_minutes = (speedrun_time / 1000) / 60
	set_text("Time: " + str(time_minutes) + "." + str(time_seconds) + "." + str(time_mill))
