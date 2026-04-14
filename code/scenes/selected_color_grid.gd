extends ColorRect

func _ready() -> void:
	Event.update_background.connect(update_color)

func update_color():
	var _color : Color = Palette.get_selected_color()
	var _tween = create_tween()
	_tween.tween_property(self,"color",_color,0.25)
	#set_color(_color)
