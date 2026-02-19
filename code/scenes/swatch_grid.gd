extends GridContainer

@onready var tile_swatch = $"../.."
@onready var dot_scene = preload("res://scenes/swatch_dot.tscn")
@onready var swatch_hue : float = randf_range(0.0,1.0)
@onready var swatch_saturation : float = randf_range(0.0,1.0)
@onready var swatch_value : float = randf_range(0.0,1.0)
@onready var img
@onready var tex
@onready var tile_index : int

func _ready() -> void:
	var target_size = Vector2i(tile_swatch.size)
	#set_size(target_size) HACK: disabled because resizing at runtime causes it to break
	spawn_dots_until_full()

func spawn_dot():
	var dot_instance = dot_scene.instantiate()
	add_child(dot_instance)

func spawn_dots_until_full():
	#TODO: rewrite spawns dots according to instructions. 
	#or maybe I use the viewport method on the whole picture frame? maybe I don't need to construct a ton of tiny grids to do this.
	while get_child_count() < 256:
		spawn_dot()
		var last_child : ColorRect = get_child(get_child_count()-1)
		last_child.set_hsv(swatch_hue)

func set_tile_index_on_self(parent_index : int):
	tile_index = parent_index
