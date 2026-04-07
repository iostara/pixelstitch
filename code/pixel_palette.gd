extends Node

#TODO this autoload exists to handle the color palette and pixels designated to its colors on a global level. swatches signal up to this autoload, and the color values get broadcast out to colored tiles

@onready var color_palette : Array[Color] ##holds the colors of the current palette
