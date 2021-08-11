extends Node

#board
var cell_scene: PackedScene = ResourceLoader.load("Scenes/Cell.tscn")
var mark_scene: PackedScene = ResourceLoader.load("Scenes/Mark.tscn")
var cells_total:int = 40
var spacing:float = 3.0

#data
var cell_array = []

func _ready():
	spawn_cells()

func spawn_cells():
	var direction = Vector2.RIGHT
	var last_pos = Vector3.ZERO
	
	for i in range(cells_total):
		if i % (cells_total / 4) == 0:
			var inverted_x = direction.x * -1
			direction.x = -direction.y
			direction.y = -inverted_x
			
		var temp_cell = cell_scene.instance()
		cell_array.append(temp_cell)
		
		#data
		temp_cell.index = i
		
		#position
		var direction_3d = Vector3(direction.x, 0, direction.y)
		temp_cell.translation = (direction_3d * spacing) + last_pos
		last_pos = temp_cell.translation
		
		#color
		var mat = SpatialMaterial.new()
		temp_cell.get_child(0).set_surface_material(0, mat)
		
		add_child(temp_cell)
