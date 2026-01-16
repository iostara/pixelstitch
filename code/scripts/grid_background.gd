extends PanelContainer

var active : bool = false

@export var timeout_duration : int = 10

@onready var animation_player = $AnimationPlayer
@onready var grid_time_out : Timer = %GridTimeOut
func activateGrid():
	if !active:
		fadeIn()
		active = true
		grid_time_out.start(timeout_duration)

func deactivateGrid():
	if active:
		fadeOut()
		active = false

func fadeIn():
	#HACK: animation_player.play("fade_in")
	pass
	
func fadeOut():
	#HACK: animation_player.play("fade_out")
	pass
	
func _on_grid_time_out_timeout() -> void:
	deactivateGrid()
