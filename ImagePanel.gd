extends Panel

var colors: PoolColorArray
var emotions: Array
var circleRadius: float
var circleColor: Color

var rng = RandomNumberGenerator.new()

func _ready():
	for i in range(4):
		colors.append(Color(0,0,0,0))
	pass


func _draw():
	for i in range(rng.randf_range(400, 600)):
		circleColor = colors[rng.randf_range(0,colors.size())]
		circleRadius = rng.randf_range(5,40)
		draw_circle(Vector2(rng.randf_range(0,800), rng.randf_range(0,600)), circleRadius, circleColor)


func _on_GenerateButton_pressed():
	
	var sel = get_parent().get_node("ColorsPanel").select

	if(sel):
		print("select")
		colors = get_parent().get_node("ColorsPanel").select_colors
	else:
		print("pool")
		colors = get_parent().get_node("ColorsPanel").pool_colors

	for i in range(colors.size()): # debug
		print(colors[i])

	self.update()
