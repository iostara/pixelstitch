extends ColorRect


var mouse_over : bool = false
@onready var animation_player = $AnimationPlayer
@onready var content_panel = %ContentPanel

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("click") and mouse_over:
		onClick()

func _on_mouse_entered() -> void:
	mouse_over = true
	print("mouse over panel")

func _on_mouse_exited() -> void:
	mouse_over = false
	print("mouse not over panel")

func triggerEffect():
	animation_player.play("blur_in_out")
	pass

func onClick():
	print("onClick()")
	triggerEffect()
