extends AspectRatioContainer
# when this swatch is pressed, the current swatch is selected. if it is long-pressed, we enter the swatch-edit mode.
@onready var tile_index : int
@onready var swatch_viewport = %SwatchViewport
@onready var swatch_grid = %SwatchGrid

func _ready() -> void:
	tile_index = get_parent().get_child_count()-1
	set_grid_index() ##the grid needs to know what its index is since it is the one signalling the Global script
	
	#HACK: disabled for now since it only works when I manually size these components
#	swatch_grid.set_size(Vector2i(size.x,size.x)) 
#	swatch_viewport.set_size(Vector2i(size.x,size.x))

func set_selected_swatch():
	Global.selected_tile_index = tile_index
	Screen.print(str("setting Global.tile_index to ", str(tile_index)))
	pass

func _on_multi_touch_screen_button_pressed() -> void:
	set_selected_swatch()

func set_grid_index():
	swatch_grid.set_tile_index_on_self(tile_index)
