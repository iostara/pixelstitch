extends GridContainer

@onready var pixel_scene = load("res://scenes/pixel.tscn") #pointing to the scene file for pixels
@onready var grid_background = %GridBackground
@onready var draw_sound : AudioStreamPlayer2D = %DrawSound
@export var grid_size : int ## how many columns / rows. a value of 2 will mean a 2x2 grid containing 4 pixel squares
var pixel_count_actual : int = grid_size * grid_size
var undo_redo = UndoRedo.new()

func _ready():
	reset_grid(grid_size)
func spawn_pixels(): 
	#var spawnCount : int = 0
	pixel_count_actual = get_child_count()
	print(str("gridsize*gridsize = ",grid_size*grid_size))
	while get_child_count() > (grid_size * grid_size):
		remove_child(get_child(0))
	
	while pixel_count_actual < (257):
		var pixel_instance = pixel_scene.instantiate()
		add_child(pixel_instance)
		#spawnCount = spawnCount + 1
		#print(str(spawnCount, " pixels spawned"))
		pixel_count_actual = get_child_count()
	
func reset_grid(_grid_size):
	_grid_size = _grid_size
	spawn_pixels()
	columns = _grid_size

func _on_row_slider_value_changed(value):
	reset_grid(value)

func reset_pixels():
	get_tree().call_group("pixels","reset")

func _on_reset_confirm_confirmed():
	reset_pixels()

func drawToPixel(target):##target should be the self-reported name of whichever pixel node calls this function
	#grid_background.activateGrid()
	var current_color = target.color
	undo_redo.create_action("Draw")
	undo_redo.add_do_property(target,"color",Global.picked_color)
	undo_redo.add_undo_property(target,"color",current_color)
	undo_redo.commit_action()
	drawSound()

func drawSound():
	var sound_bank : Array[AudioStreamOggVorbis] = draw_sound.sound_bank
	draw_sound.set_stream(sound_bank.pick_random())
	var pitch = Global.pitch_from_color + randf_range(-0.1,0.1)
	print("pitch value: ",str(pitch))
	#draw_sound.pitch_scale = pitch #FIXME pitch scale is getting set to a value less than zero
	#draw_sound.play()
	#HACK: disabled sound effects pending rewrite


func _on_undo_pressed() -> void:
	undo_redo.undo()

func _on_redo_pressed() -> void:
	undo_redo.redo()



func _on_reset_button_pressed() -> void:
	pass
