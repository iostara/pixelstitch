extends ColorPicker

@onready var picker_sound : AudioStreamPlayer2D = %PickerSound

func _on_color_changed(_color):
	Global.picked_color = _color
	playPickerSound()
func playPickerSound():
	var colorAverage = color.r + color.g + color.b / 3
	var modifiedAverage = colorAverage / 2 + .5
	var pitchFromColor = modifiedAverage
	Global.pitch_from_color = pitchFromColor
	playSound(pitchFromColor)

func changeColor(color_id):
	color = color_id

func playSound(pitch):
	picker_sound.pitch_scale = pitch
	if !picker_sound.playing:
		picker_sound.play()
