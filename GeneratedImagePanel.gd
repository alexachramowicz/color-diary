extends Panel


var sel
var list
var colors: PoolColorArray
var emotions: Array

var shape_range
var bg_color: Color
var shape: int
var xy_vec: Vector2

var circle_radius: float
var rand_color: Color

var start
var end
var count
var arc_radius

var pool: PoolVector2Array = PoolVector2Array([Vector2(0,0),Vector2(500,0),Vector2(500,400),Vector2(0,400)])
var color_pool: PoolVector2Array

var dynamic_font = DynamicFont.new()
var rng = RandomNumberGenerator.new()


func _ready():
	for i in range(4):
		colors.append(Color(0,0,0,0))


func _draw():
	
	shape = rng.randi_range(1,3)
	if(shape == 1): # circle
		shape_range = rng.randf_range(500,750)
		for i in range(shape_range):
			xy_vec = Vector2(rng.randf_range(0,800), rng.randf_range(0,600))
			rand_color = colors[rng.randf_range(0,colors.size())]
			circle_radius = rng.randf_range(5,40)
			draw_circle(xy_vec, circle_radius, rand_color)

	elif(shape==2): # mesh
		color_pool = pool
		pool.invert()
		draw_primitive(pool, colors, color_pool)

	else:
		shape_range = rng.randf_range(100,200)
		for i in range(shape_range):
			xy_vec = Vector2(rng.randf_range(0,800), rng.randf_range(0,600))
			rand_color = colors[rng.randf_range(0,colors.size())]
			start = rng.randf_range(0,360)
			end = rng.randf_range(0,360)
			count = rng.randi_range(2,50)
			arc_radius = rng.randf_range(1,100)
			draw_arc(xy_vec,arc_radius,start,end,count,rand_color)
	
	draw_rect(Rect2(Vector2(0,370), Vector2(500,30)), Color(0,0,0,1), true)

	var font_choice = rng.randi_range(1,5)
	if(font_choice==1):
		dynamic_font.font_data = load("res://fonts/Brusher.ttf")
	elif(font_choice==2):
		dynamic_font.font_data = load("res://fonts/Blanchope.ttf")
	elif(font_choice==3):
		dynamic_font.font_data = load("res://fonts/BebasNeue-regular.ttf")
	else:
		dynamic_font.font_data = load("res://fonts/Vogue.ttf")

	dynamic_font.size = 20
	list = PoolStringArray(emotions).join(", ")
	draw_string(dynamic_font, Vector2(10,390), list)


func _on_GenerateButton_pressed():
	emotions = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("EmotionsPanel").emotions_selected
	sel = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorsPanel").select

	if(sel):
		print("select")
		colors = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorsPanel").select_colors
	else:
		print("pool")
		colors = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorsPanel").pool_colors

	for i in range(colors.size()): # debug
		print(colors[i])

	self.update()


func _on_RegenerateButton_pressed():
	self.update()
