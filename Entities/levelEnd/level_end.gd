extends Area2D

signal finish_level

func _ready():
	pass

func _on_body_entered(body: Node2D) -> void:
	if(body.has_method("add_sauce")):
		finish_level.emit()
		queue_free()
