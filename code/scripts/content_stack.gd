extends VBoxContainer

@export var current_content : Content
@export var content_list : Array[Content]

@onready var headline : RichTextLabel = %HeadlineContent
@onready var body : RichTextLabel = %BodyContent
@onready var image : TextureRect = %ImageContent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	applyContent() #this is a test

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func applyContent():
	headline.set_text(current_content.headline_text)
	body.set_text(current_content.body_text)
	image.set_texture(current_content.image)
	
func refreshContent():
	current_content = content_list.pick_random()
	applyContent()
	pass
