extends AspectRatioContainer
# when this swatch is pressed, the current swatch is selected. if it is long-pressed, we enter the swatch-edit mode.

@onready var tile_index : int

func _ready() -> void:
	tile_index = get_parent().get_child_count()-1

func set_selected_swatch():
	Global.selected_tile_index = tile_index
	Screen.print(str("setting Global.tile_index to ", str(tile_index)))
	pass


func _on_multi_touch_screen_button_pressed() -> void:
	set_selected_swatch()
