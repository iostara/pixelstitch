extends Node

##TODO GlobalUndoRedo is what undoable actions will run through

@onready var undo_redo = UndoRedo.new()


func draw_tile(_tile:Tile):
	var _old_index = _tile.get_tile_index()
	var _new_index = Palette.get_selected_swatch_index()
	undo_redo.create_action("Draw Tile")
	undo_redo.add_do_property(_tile,"tile_index",_new_index)
	undo_redo.add_undo_property(_tile,"tile_index",_old_index)
	undo_redo.add_do_method(_tile.update_tile_color)
	undo_redo.add_undo_method(_tile.update_tile_color)
	undo_redo.commit_action()

func palette_swap():
	var _palette = Palette
	var _new_colors = Palette.generate_palette(false)
	var _old_colors : Array[Color] = Palette.colors
	undo_redo.create_action("palette swap")
	undo_redo.add_do_property(_palette,"colors",_new_colors)
	#undo_redo.add_do_method(_palette.clear_colors)
	undo_redo.add_do_method(_palette.update_colors)
	
	undo_redo.add_undo_property(_palette,"colors",_old_colors)
	#undo_redo.add_undo_method(_palette.clear_colors)
	undo_redo.add_undo_method(_palette.update_colors)
	
	undo_redo.commit_action()
	#TODO palette swap needs to happen through this autoload so that undo affects it
	#store arrays instead of ints
	pass
func undo():
	undo_redo.undo()
func redo():
	undo_redo.redo()
