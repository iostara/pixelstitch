extends GridContainer

var allow_new_color = true
var mouse_down = false
var recent_color : Array[Color]

@export var swatch_list_max = 7
@export var swatch_node : Array[AspectRatioContainer]


func _ready() -> void:
	for n in swatch_list_max:
		var input_color : Color = Color(randf_range(0.0,1.0),randf_range(0.0,1.0),randf_range(0.0,1.0),1)
		swatch_node[n].setSwatch(input_color) 
		recent_color.push_front(swatch_node[n].current_color)
	
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"): #FIX: rewrite for touch interface support
		allow_new_color = true

func _on_color_picker_color_changed(color: Color) -> void:
	if allow_new_color:
		allow_new_color = false
		recent_color.push_front(color)
		recent_color.resize(swatch_list_max)
		for n in recent_color.size():
			swatch_node[n].setSwatch(recent_color[n])

#TODO: make the color picker animation allow color changes once it has finished its animation
