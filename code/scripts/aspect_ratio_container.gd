extends AspectRatioContainer

@onready var swatch = $Color
@onready var current_color : Color
@onready var mask = $SwatchMask
func setSwatch(input_color):
	print("setSwatch()")
	current_color = input_color
	swatch.color = input_color
func animateSwatch():
	mask.animateMask()
