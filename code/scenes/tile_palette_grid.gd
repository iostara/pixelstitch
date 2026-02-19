extends GridContainer

@onready var swatch_scene = preload("res://scenes/tile_swatch.tscn")

func _ready() -> void:
	spawn_swatches_until_full()
	Event.mode_toggle.connect(mode_switch)

func spawn_swatch():
	var swatch_instance = swatch_scene.instantiate()
	add_child(swatch_instance)

func spawn_swatches_until_full():
	if Global.mode == Global.modes.TILE_DESIGNER:
		pass
	else:
		while get_child_count() < 8:
			spawn_swatch()

func mode_switch():
	if Global.mode == Global.modes.TILE_DESIGNER:
		reset_palette()
		spawn_swatches_until_full()

func reset_palette():
	pass
