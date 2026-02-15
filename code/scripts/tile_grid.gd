extends GridContainer

var tile_scene = load("res://scenes/tile_template.tscn")

func _ready() -> void:
	spawn_until_full()

func spawn_tile():
	var tile_instance = tile_scene.instantiate()
	add_child(tile_instance)

func spawn_until_full():
	while get_child_count() < 256:
		spawn_tile()
