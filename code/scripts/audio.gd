extends AudioStreamPlayer

@export var sfx_bank : Array[AudioStreamWAV]

func _ready() -> void:
	Event.draw_sfx.connect(trigger_sfx.bind(2))
	Event.roll_sfx.connect(trigger_sfx.bind(4))
	Event.redo_sfx.connect(trigger_sfx.bind(3))
	Event.undo_sfx.connect(trigger_sfx.bind(1))
	Event.swatch_sfx.connect(trigger_sfx.bind(0))



func trigger_sfx(_index:int):
	pitch_scale = randf_range(0.5,1.0)
	set_stream(sfx_bank[_index])
	play()
