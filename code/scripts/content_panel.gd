extends PanelContainer

@onready var content_stack = $ContentStack

func refreshContent():
	content_stack.refreshContent()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
