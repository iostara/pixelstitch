extends ColorRect

func _ready() -> void:
	Event.update_background.connect(update_color)

func update_color():
	#var _color : Color = Palette.get_selected_color()
	#var _tween = create_tween()
	#set_color(_color)
	#_tween.tween_property(self,"color",Color(0.0, 0.0, 0.0, 1.0),1.75)
	pass
