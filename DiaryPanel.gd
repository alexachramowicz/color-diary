extends Panel


var image = Image.new()
var image2 = Image.new()
var image3 = Image.new()
var texture = ImageTexture.new()
var texture2 = ImageTexture.new()
var texture3 = ImageTexture.new()

func _ready():
	
	var date = OS.get_date()
	var current_date = String(date.month) + "/" + String(date.day) + "/" + String(date.year)
	print(current_date)
	
	$DiaryItemlist.max_columns = 2
	
	image.load("res://images/angry-3-8-2020.png")
	texture.create_from_image(image)
	$DiaryItemlist.add_icon_item(texture)
	$DiaryItemlist.add_item(current_date)
	
	image2.load("res://images/happy-3-8-2020.png")
	texture2.create_from_image(image2)
	$DiaryItemlist.add_icon_item(texture2)
	$DiaryItemlist.add_item(current_date)
