extends GridContainer

@onready var swatch_scene = preload("res://scenes/tile_swatch.tscn")

func _ready() -> void:
	spawn_swatches_until_full()

func spawn_swatch():
	var swatch_instance = swatch_scene.instantiate()
	add_child(swatch_instance)

func spawn_swatches_until_full():
	while get_child_count() < 8:
		spawn_swatch()
