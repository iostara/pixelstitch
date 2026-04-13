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
	generate_palette()
	update_colors()

func clear_colors():
	colors.clear()

func update_colors():
	update_swatch_colors()
	update_tile_colors() 
	Event.update_background.emit()
	
func update_swatch_colors():
	for n in swatches.size():
		swatches[n-1].set_swatch_color(colors[n-1])

func update_tile_colors():
	get_tree().call_group("tile","update_tile_color")

func get_selected_color():
	return colors.get(selected_swatch_index)

func generate_palette(): ##TODO will replace update_swatch_colors()
	var _max_interval : float = 0.125
	var _min_interval : float = 0.0625
	var _interval : float = randf_range(_min_interval,_max_interval)
	var _margin : float = (1.0 - _interval * 8) / 2
	var _hue : float
	var _saturation : float
	var _value : float
	var _color : Color
	for n in swatches.size():
		if n > 0:
			_hue = _hue + randf_range(0.2,0.8)
			if _hue > 1.0: #HACK _hue + _interval
				_hue = _hue - 1.0
			_saturation = _saturation - _interval
			_value = _value + _interval
		else:
			_hue = randf_range(0.0,1.0)
			_saturation = 1.0 - _margin
			_value = _margin
		_color = Color.from_hsv(_hue, _saturation, _value)
		colors.append(_color)
