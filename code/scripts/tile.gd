extends AspectRatioContainer

class_name Tile

#TODO: when the tile index changes, this tile needs to change its texture. when the texture for its state changes. 

@onready var tile_color : ColorRect = %TileColor
@export var tile_index : int##this determines which tile of the given tile_palette. user input and currently selected tile swatch change its value.

func _ready() -> void:
	add_to_group("tile")
	set_random_index()
func update_tile_color():
	tile_color.update_tile_color(tile_index)
func set_random_index():
	tile_index = randi_range(0,7)
func get_tile_index():
	return tile_index
func draw_tile():
	if tile_index != Palette.get_selected_swatch_index():
		GlobalUndoRedo.draw_tile(self)
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if event.position.x > global_position.x and event.position.x < global_position.x + size.x:
			if event.position.y > global_position.y and event.position.y < global_position.y + size.y:
				draw_tile()
