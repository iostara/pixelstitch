extends TextureRect

#TODO: make every pixel spawn a label on itself with its number in the sequence


var undo_redo = UndoRedo.new() ## I think this initializes the undo function?
var mouse_over : bool = false
@export var current_tile_array : Array[Texture2D]
@export var current_color : Color = Color(1,1,1,1)
@onready var color_history : Array[Color] ## holds the last 10 colors that this pixel node has been
@onready var pixel_grid = get_parent()
#@onready var mask_animator = $MaskAnimator
@onready var corner_position_a : Vector2
@onready var corner_position_b : Vector2

func _ready():
	reset()

#func _unhandled_input(event: InputEvent) -> void:
#	if event is InputEventScreenTouch or event is InputEventScreenDrag:
#		if event.position.x > global_position.x and event.position.x < global_position.x + size.x:
#			if event.position.y > global_position.y and event.position.y < global_position.y + size.y:
#				#if Global.picked_color != get_color():  FIXME: replace with a new function since this is no longer a colorrect
#					queueDraw()

func checkTouchPosition():
	pass

#func queueDraw():##tells PixelGrid that this node needs to draw
#	pixel_grid.drawToPixel(self)
#	mask_animator.play("on_click")

func commitDraw(assigned_color):##gets called by pixel_grid once draw has run through the undo_redo queue
	print("Draw color ", assigned_color)

func _on_mouse_entered():
	mouse_over = true

func _on_mouse_exited():
	mouse_over = false

func reset(): ##just sets the color back to default value. hardcoded black at the moment
	set_tile_to_index()
	#set_color(initial_color) FIXME: replace with a new function since this is no longer a colorrect

func set_tile_to_index():
	texture = current_tile_array[0]

func getBoundaries():
	corner_position_a = global_position
	corner_position_b = global_position + size
