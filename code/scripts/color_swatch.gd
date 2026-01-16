extends ColorRect

var mouse_over : bool = false
@onready var swatch_container = $".."
@onready var mask = $"../SwatchMask" 
@onready var audio : AudioStreamPlayer2D = $AudioStreamPlayer2D
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("click"):
	#	if mouse_over:
	#		activateSwatch()

func activateSwatch():
	Global.picked_color = color
	playSwatchSound()
	get_tree().call_group("color_picker","changeColor",color)
	mask.animateMask()

func playSwatchSound():
	var colorAverage = color.r + color.g + color.b / 3
	var modifiedAverage = colorAverage / 2 + .5
	var pitchFromColor = modifiedAverage
	Global.pitch_from_color = pitchFromColor
	playSound(pitchFromColor)

func _on_mouse_entered() -> void:
	mouse_over = true

func _on_mouse_exited() -> void:
	mouse_over = false

func _on_button_pressed() -> void:
	activateSwatch()
	pass # Replace with function body.

func playSound(pitch):
	audio.pitch_scale = pitch
	audio.play()
