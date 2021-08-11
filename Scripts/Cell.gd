extends Spatial

onready var label = $Viewport/Label
onready var material = $MeshInstance.get("material/0")

var index = -1
var landings: int = 0
var chance: float = 0

func process_landing():
	landings += 1
	chance = (landings * 100.0) / GameLogic.dice_throws

func update_indicators(min_chance, max_chance):
	var relative_chance = 0

	if max_chance-min_chance < 0.05:
		relative_chance = 1
	else:
		relative_chance = (chance - min_chance) / (max_chance - min_chance)
		
	label.text = "index: " + str(index) + \
	"\nlandings: " + str(landings) + \
	"\nchance: " + str(chance) + "%" + \
	"\nrelative chance: " + str(relative_chance)
	
	if index == 39:
		material.albedo_color = Color (0, relative_chance, 0)
	elif index == 9:
		material.albedo_color = Color (relative_chance, relative_chance, 0)
	elif index == 29:
		material.albedo_color = Color (relative_chance, 0, 0)
	else:
		material.albedo_color = Color (relative_chance, relative_chance, relative_chance)
