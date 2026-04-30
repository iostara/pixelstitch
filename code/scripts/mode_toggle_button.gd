extends Button

func _ready() -> void:
	text = name

func _on_pressed() -> void:
	Event.mode_toggle.emit()
	Screen.print("Mode toggle button emitted signal to event manager")
