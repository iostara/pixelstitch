#BIG GOALS
#TODO: replace current color system with an indexed color/tile system
#TODO: rewrite all input-handling code for touch
#TODO: create eraser feature

extends Node

var picked_color : Color = Color(0,0,0,1)
var draw_mode : bool = false
var primary_color : Color
var secondary_color : Color
var tertiary_color : Color
var pitch_from_color : float
