extends ColorRect

var undo_redo = UndoRedo.new() ## I think this initializes the undo function?
var mouse_over : bool = false

@export var history_buffer_size = 10 ##this value should match however many steps we're able to undo
@export var initial_color : Color = Color(1,1,1,1)

@onready var color_history : Array[Color] ## holds the last 10 colors that this pixel node has been
@onready var current_step : int = history_buffer_size - 1 ##track the current step of this pixel for undo and redo
@onready var pixel_grid = get_parent()
@onready var mask_animator = $MaskAnimator
@onready var corner_position_a : Vector2
@onready var corner_position_b : Vector2

func _ready():
	reset()

func _process(delta):
	#if Input.is_action_pressed("click") && mouse_over && Global.picked_color != get_color():
	#	queueDraw()
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if event.position.x > global_position.x and event.position.x < global_position.x + size.x:
			if event.position.y > global_position.y and event.position.y < global_position.y + size.y:
				if Global.picked_color != get_color(): #FIX error when I click a pixel, "invalid access to property or key 'picked_color' 
					queueDraw()

func checkTouchPosition():
	pass

func initializeColorHistory():
	color_history.resize(history_buffer_size)
	color_history.fill(initial_color)

func queueDraw():##tells PixelGrid that this node needs to draw
	pixel_grid.drawToPixel(self)
	mask_animator.play("on_click")

func commitDraw(assigned_color):##gets called by pixel_grid once draw has run through the undo_redo queue
	print("Draw color ", assigned_color)

func _on_mouse_entered():
	mouse_over = true

func _on_mouse_exited():
	mouse_over = false

func reset(): ##just sets the color back to default value. hardcoded black at the moment
	set_color(initial_color)

func getBoundaries():
	corner_position_a = global_position
	corner_position_b = global_position + size
