#BIG GOALS
#TODO: create eraser feature


extends Node

var picked_color : Color = Color(0,0,0,1)
var draw_mode : bool = false
var primary_color : Color
var secondary_color : Color
var tertiary_color : Color
var pitch_from_color : float
var selected_tile_index : int = randi_range(0,7)
