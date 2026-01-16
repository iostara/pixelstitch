extends HBoxContainer

@onready var undo_redo_sound : AudioStreamPlayer2D = %UndoRedoSound

func playUndoRedoSound():
	undo_redo_sound.play()

func _on_redo_pressed() -> void:
	undo_redo_sound.pitch_scale = 1.1
	playUndoRedoSound()
	pass # Replace with function body.

func _on_undo_pressed() -> void:
	undo_redo_sound.pitch_scale = 0.9
	playUndoRedoSound()
	pass # Replace with function body.
