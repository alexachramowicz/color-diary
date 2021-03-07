extends Panel


var bg_color: Color = Color(0,0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _draw():
	draw_rect(Rect2(0,0,500.0,400.0), bg_color, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ColorPickerButton_color_changed(color):
	bg_color = color
	self.update()
