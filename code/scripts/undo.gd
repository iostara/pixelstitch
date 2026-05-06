extends Button


func _on_pressed() -> void:
	GlobalUndoRedo.undo()
	animate_press()
	Event.undo_sfx.emit()

func animate_press():
	var _tween = create_tween()
	_tween.tween_method(set_shader_value,0.25,5.0,0.05)
	_tween.tween_method(set_shader_value,5.0,0.25,0.75)
	

func set_shader_value(_value : float):
	self.material.set_shader_parameter("strength",_value)
	
