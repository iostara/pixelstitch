extends VBoxContainer

@onready var header_node : RichTextLabel = $HeaderText
@onready var body_node : RichTextLabel = $BodyText
@onready var image_node : TextureRect = %ImageContent
@export var content_list : Array[Resource]

var current_content : int = 0 ##keeps track of which array item we're pulling from

func _ready() -> void:
	insertContent(content_list[current_content])
	pass

func insertContent(content_resource : Content): ## get data from resource and swap into child nodes
	header_node.text = content_resource.headline_text.to_upper()
	body_node.text = content_resource.body_text
	image_node.texture = content_resource.image

func cycleContent():
	if current_content < content_list.size() - 1:
		current_content += 1
	else:
		current_content = 0
	insertContent(content_list[current_content])
	



func _on_timer_timeout() -> void:
	cycleContent()
