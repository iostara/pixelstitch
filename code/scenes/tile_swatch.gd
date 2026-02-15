extends AspectRatioContainer
# when this swatch is pressed, the current swatch is selected. if it is long-pressed, we enter the swatch-edit mode.

@onready var tile_index : int

func _ready() -> void:
	tile_index = get_parent().get_child_count()-1

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if event.position.x > global_position.x and event.position.x < global_position.x + size.x:
			if event.position.y > global_position.y and event.position.y < global_position.y + size.y:
				touch_action()
func touch_action():
	set_selected_swatch()
	pass

func set_selected_swatch():
	Global.selected_tile_index = tile_index
	Screen.print("set_selected_swatch()")
	pass


func _on_multi_touch_screen_button_pressed() -> void:
	touch_action()
