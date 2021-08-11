extends Spatial

var current_index = 39

func move(amount):
	var cell_array_size = CellSpawner.cell_array.size()
	
	if amount + current_index < cell_array_size:
		current_index += amount
	else:
		current_index = amount - (cell_array_size - current_index)
	
	return  CellSpawner.cell_array[current_index]
