extends TextureRect

#TODO: maybe this texturerect, using a viewport texture, can convert that image to a Texture2D resource at runtime which can then be used on the canvas.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_multi_touch_screen_button_pressed() -> void:
	capture_texture()

func capture_texture():
	Screen.print("send to global index_texture")
	return get_texture()
