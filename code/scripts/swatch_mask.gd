extends ColorRect

@onready var animation_player = %MaskAnimator

func animateMask():
	print("animateMask()")
	animation_player.stop()
	animation_player.play("on_clicked")
