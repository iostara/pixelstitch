extends GridContainer

var tile_scene = load("res://scenes/tile_template.tscn")

func _ready() -> void:
	spawn_tile()
	spawn_tile()

func spawn_tile():
	var tile_instance = tile_scene.instantiate()
	add_child(tile_instance)
	pass

func spawn_until_full():
	pass
