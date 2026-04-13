extends ColorRect

func _ready() -> void:
	Event.update_background.connect(update_color)

func update_color():
	var _color : Color = Palette.get_selected_color()
	set_color(_color)
