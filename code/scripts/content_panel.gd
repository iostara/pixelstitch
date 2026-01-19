extends PanelContainer

@onready var content_stack = $ContentStack

func refreshContent():
	content_stack.refreshContent()
	
#TODO: replace the content panel with the tileset picker
