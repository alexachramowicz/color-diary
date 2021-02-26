extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rand_color = Color(randf(), randf(), randf())

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
