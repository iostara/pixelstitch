extends AspectRatioContainer

class_name Swatch

@onready var swatch_index : int
@onready var swatch_color = %SwatchColor


func _ready() -> void:
	Palette.swatches.append(self)
	set_swatch_index(Palette.get_swatch_index_from_array(self))
	
	
func set_swatch_index(_index : int): 
	swatch_index = _index
func get_swatch_index():
	return swatch_index
func set_selected_swatch():
	Palette.selected_swatch_index = swatch_index
	#Screen.print(str("setting Palette.selected_swatch_index to ", str(swatch_index)))
	Event.swatch_selected.emit()
	Event.update_background.emit()
	

func set_swatch_color(_color:Color):
	swatch_color.set_color(_color)
	
func _on_multi_touch_screen_button_pressed() -> void:
	set_selected_swatch()
	
#func set_active_shader():
	#Screen.print(str("running set_active_shader() for ", swatch_index))
	#if Global.selected_swatch_index == swatch_index:
		#toggle_shader_animator(true)
		#Screen.print(str("activating shader for ",swatch_index),Color(0.19, 0.83, 0.532, 1.0))
	#elif shader_toggle_animator.current_animation_position > 0:
		#toggle_shader_animator(false)
		#Screen.print(str("de-activating shader for ",swatch_index),Color(0.706, 0.294, 0.136, 1.0))
