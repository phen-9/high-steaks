extends StateMachine

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if(area.has_method("endgame_yourself")):
		on_child_transition(current_state,"dead")
