extends GridContainer

@onready var swatch_scene = preload("res://scenes/swatch.tscn")

func _ready() -> void:
	spawn_swatches_until_full()

func spawn_swatch():
	var swatch_instance = swatch_scene.instantiate()
	add_child(swatch_instance)

func spawn_swatches_until_full():
	while get_child_count() < 8:
		spawn_swatch()
	Palette.roll_colors()
	#once spawned, we want to append the last child spawned to the array stored in the global pixelpalette. if we tell the child to handle this on instantiation, 


func mode_switch():
	if Global.mode == Global.modes.TILE_DESIGNER:
		reset_palette()
		spawn_swatches_until_full()

func reset_palette():
	pass
