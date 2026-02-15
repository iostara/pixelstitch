extends ColorRect

@onready var hue : float
@onready var saturation : float
@onready var value : float

func set_hsv(swatch_hue : float):
	color = Color().from_hsv(swatch_hue,randf_range(0.0,1.0),randf_range(0.0,1.0))
	
