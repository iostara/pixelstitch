extends Node

var picked_color : Color = Color(0,0,0,1)
var draw_mode : bool = false
var primary_color : Color
var secondary_color : Color
var tertiary_color : Color
var pitch_from_color : float
var selected_tile_index : int = randi_range(0,7)

enum modes {TILE_DESIGNER, QUILT_DESIGNER}

var mode = modes.QUILT_DESIGNER
var index_texture : Texture2D

var texture_palette : Array[Texture2D] ##this array stores the 8 swatches from the currently selected palette as Texture2D resources

func _ready() -> void:
	Event.mode_toggle.connect(toggle_mode)

func toggle_mode():
	if mode == modes.TILE_DESIGNER:
		mode = modes.QUILT_DESIGNER
		Screen.print("global mode set to quilt designer",Color(0.624, 0.367, 0.832, 1.0),5.0)
	else:
		mode = modes.TILE_DESIGNER
		Screen.print("global mode set to tile designer",Color(0.178, 0.74, 0.271, 1.0),5.0)
