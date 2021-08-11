extends Node

onready var player = $"/root/Scene/Player"
var random = RandomNumberGenerator.new()
var is_running = false

#data
var dice_throws:int = 0

func _ready():
	random.randomize()
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		is_running = !is_running
		
	if Input.is_action_just_pressed("ui_right"):
		do()
		
	if !is_running:
		return
		
	do()
	
func do():
	var dice_number = throw_dice()
	var landed_cell = player.move(dice_number)
	
	landed_cell.process_landing()

func throw_dice():
	dice_throws += 1
	return random.randi_range(2, 12)
