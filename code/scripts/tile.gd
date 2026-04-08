extends ColorRect

class_name Tile

#TODO: when the tile index changes, this tile needs to change its texture. when the texture for its state changes. 

@export var tile_index : int##this determines which tile of the given tile_palette. user input and currently selected tile swatch change its value.
@export var palette_index : int ##this determines which palette is used.
@export var palette_library : Array[Resource] ##all of the tilesets in the form of their own arrays, each with its own index

func _ready() -> void:
	add_to_group("tile")
	print("added to group")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if event.position.x > global_position.x and event.position.x < global_position.x + size.x:
			if event.position.y > global_position.y and event.position.y < global_position.y + size.y:
				update_tile_index()
				update_tile_color()
func update_tile_index():
	tile_index = Palette.selected_swatch_index
	
func update_tile_color():
	set_color(Palette.color_palette[tile_index])

	#TODO rewrite tile_template so that it doesn't hold any color information besides its own current color and index. it looks up the color it needs based on its index, and its index is the thing that gets changed when it is drawn on by user input.
	
	
	#var target_palette : Array[Texture2D] = palette_library.get(palette_index).get("texture_payload")
	#set_texture(target_palette.get(Global.selected_tile_index))

#func draw_from_global_index():
	#set_texture(Global.index_texture)
