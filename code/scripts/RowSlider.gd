extends VSlider

var draw_mode : bool ## this controls whether or not we can see or mess with the slider. if draw_mode is true, slider is hidden. false, not hidden.


func _on_reset_button_pressed():
	pass #moved to reset confirm signal


func _on_reset_confirm_confirmed():
	show()
