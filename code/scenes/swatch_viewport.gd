extends SubViewport

@onready var tile_swatch = $".."

@onready var img
@onready var tex

func _ready() -> void:
	var target_size = Vector2i(tile_swatch.size)
#	set_size(target_size) HACK: disabled because resizing at runtime causes it to break
