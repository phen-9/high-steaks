extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.has_method("add_sauce")):
		$WallLabel.text = "Hold shift while touching a wall to grab it"



func _on_area_2d_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
		if(body.has_method("add_sauce")):
			$SauceLabel.text = "Pick up sauce to unlock an air dash"
