extends AspectRatioContainer
# when this swatch is pressed, the current swatch is selected. if it is long-pressed, we enter the swatch-edit mode.
@onready var swatch_index : int
@onready var swatch_viewport = %SwatchViewport
@onready var swatch_grid = %SwatchGrid
@onready var swatch_texture = %SwatchTexture
@onready var shader_toggle_animator = %ShaderToggleAnimator

func _ready() -> void:
	swatch_index = get_parent().get_child_count()-1
	set_grid_index() ##the grid needs to know what its index is since it is the one signalling the Global script
	Event.swatch_selected.connect(set_active_shader)
	
	#HACK: disabled for now since it only works when I manually size these components
#	swatch_grid.set_size(Vector2i(size.x,size.x)) 
#	swatch_viewport.set_size(Vector2i(size.x,size.x))

func toggle_shader_animator(active : bool):
	if active:
		shader_toggle_animator.play("toggle",)
	else:
		shader_toggle_animator.play_backwards("toggle")
	pass

func set_selected_swatch():
	Global.selected_swatch_index = swatch_index
	Screen.print(str("setting Global.selected_swatch_index to ", str(swatch_index)))
	Event.swatch_selected.emit()
	pass

func _on_multi_touch_screen_button_pressed() -> void:
	set_selected_swatch()
	
func set_grid_index():
	swatch_grid.set_swatch_index_on_self(swatch_index)

func set_active_shader():
	Screen.print(str("running set_active_shader() for ", swatch_index))
	if Global.selected_swatch_index == swatch_index:
		toggle_shader_animator(true)
		Screen.print(str("activating shader for ",swatch_index),Color(0.19, 0.83, 0.532, 1.0))
	elif shader_toggle_animator.current_animation_position > 0:
		toggle_shader_animator(false)
		Screen.print(str("de-activating shader for ",swatch_index),Color(0.706, 0.294, 0.136, 1.0))
