extends State

@onready var search_area = $"../../SearchArea"

func _on_search_area_body_entered(body: Node2D) -> void:
	
	if(body.has_method("add_sauce")):
		Transitioned.emit(self,"murder")
