extends TextureRect

@export var tile_index : int = randi_range(0,7)##this determines which tile of the given tile_palette. user input and currently selected tile swatch change its value.

@export var palette_index : int ##this determines which palette is used.

@export var palette_library : Array[Resource] ##all of the tilesets in the for of their own arrays, each with its own index


func _init() -> void:

	pass

func draw_tile():
	var target_palette : Array[Texture2D] = palette_library.get(palette_index).get("texture_payload")
	set_texture(target_palette.get(tile_index))
	pass
