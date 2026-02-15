extends TextureRect

@export var tile_index : int##this determines which tile of the given tile_palette. user input and currently selected tile swatch change its value.
@export var palette_index : int ##this determines which palette is used.
@export var palette_library : Array[Resource] ##all of the tilesets in the for of their own arrays, each with its own index

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if event.position.x > global_position.x and event.position.x < global_position.x + size.x:
			if event.position.y > global_position.y and event.position.y < global_position.y + size.y:
				#draw_tile() HACK: temp disabled
				draw_from_global_index()

func draw_tile():
	var target_palette : Array[Texture2D] = palette_library.get(palette_index).get("texture_payload")
	set_texture(target_palette.get(Global.selected_tile_index))

func draw_from_global_index():
	set_texture(Global.index_texture)
