extends Node

#TODO this autoload exists to handle the color palette and pixels designated to its colors on a global level. swatches signal up to this autoload, and the color values get broadcast out to colored tiles

@onready var swatches : Array[Swatch] ##holds references to the swatches themselves
@onready var colors : Array[Color] ##color value array whose indices correspond to those of swatches
@onready var selected_swatch_index : int = 0

#func _ready() -> void:
#	roll_colors()

func get_swatch_index_from_array(_swatch:Swatch):
	return swatches.find(_swatch)

func roll_colors():
	clear_colors()
	
	for n in swatches.size():
		colors.append(Color(randf_range(0.0,1.0),randf_range(0.0,1.0),randf_range(0.0,1.0)))
	update_colors()
		
func clear_colors():
	colors.clear()

func update_colors():
	update_swatch_colors()
	update_tile_colors() 
	

func update_swatch_colors():
	for n in swatches.size():
		swatches[n-1].set_swatch_color(colors[n-1])

func update_tile_colors():
	get_tree().call_group("tile","update_tile_color")
	
	#TODO first hit every tile by looking up scene tree and then everything in tile group. then get index for each and apply respective color for that index
	pass
