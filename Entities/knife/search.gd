extends State

var knife := get_parent().get_parent()
var search_area : Area2D
const p = 5

func Enter():
	search_area = knife.follow_area
	pass

func Update(_delta : float):
	knife.velocity.x = p * (knife.start_position.x - knife.global_position)
	var bodies = search_area.get_overlapping_bodies()
	for i in bodies.size():
		var body = bodies[i]
		if(body.has_method("_on_hurtbox_area_entered")):
			print("IUFBEWUFEUHFOFOIGHOI")
			Transitioned.emit(self,"follow")
	
	
