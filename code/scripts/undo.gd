extends Button


func _on_pressed() -> void:
	GlobalUndoRedo.undo()
