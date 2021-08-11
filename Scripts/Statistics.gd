extends Node
onready var throws_label = $"../Control/ThrowsLabel"
onready var chance_label = $"../Control/ChanceLabel"


func update_timer():
	var average = 0
	var max_chance = 0
	var min_chance = 100
	
	for cell in CellSpawner.cell_array:
		average += cell.chance
	
		if cell.chance > max_chance:
			max_chance = cell.chance
		
		if cell.chance < min_chance:
			min_chance = cell.chance
			
	for cell in CellSpawner.cell_array:
		cell.update_indicators(min_chance, max_chance)		
		
	average = average / CellSpawner.cells_total
	update_labels(average, GameLogic.dice_throws, min_chance, max_chance)

func update_labels(avg, throws, min_chance, max_chance):
	throws_label.text = "throws: " + str(throws)
	chance_label.text = "average: " + str(stepify(avg, 0.1)) + "%" + \
	"\nmin: " + str(stepify(min_chance, 0.1))+ "%" + \
	"\nmax: " + str(stepify(max_chance, 0.1)) + "%"	
