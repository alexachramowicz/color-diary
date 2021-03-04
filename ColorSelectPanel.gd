extends Panel

# member variables
var rng = RandomNumberGenerator.new()
var init_colors: Color
var pool_colors: PoolColorArray
var select: bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init_colors():
	for i in range(4):
		init_colors = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())
		pool_colors.append(init_colors)
		print(pool_colors[i])
	
	$ColorOptionsContainer/MarginContainer/ColorRect.color = pool_colors[0]
	$ColorOptionsContainer/MarginContainer2/ColorRect.color = pool_colors[1]
	$ColorOptionsContainer/MarginContainer3/ColorRect.color = pool_colors[2]
	$ColorOptionsContainer/MarginContainer4/ColorRect.color = pool_colors[3]


func _on_ColorSelectButton_toggled(button_pressed):
	if(button_pressed == true):
		$ColorSelectContainer.show()
		$ColorOptionsContainer.hide()
		$RegenerateContainer.hide()
		$ColorOptionsLabel.hide()
		select = true # if select is true, pull color from pool_colors
	else:
		$ColorSelectContainer.hide()
		$ColorOptionsContainer.show()
		$RegenerateContainer.show()
		$ColorOptionsLabel.show()
		select = false # if false, pull color from select_colors

func _on_Button1_pressed():
	$ColorOptionsContainer/MarginContainer/ColorRect.color = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())

func _on_Button2_pressed():
	$ColorOptionsContainer/MarginContainer2/ColorRect.color = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())

func _on_Button3_pressed():
	$ColorOptionsContainer/MarginContainer3/ColorRect.color = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())

func _on_Button4_pressed():
	$ColorOptionsContainer/MarginContainer4/ColorRect.color = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())

# main
func _ready():
	$ColorSelectContainer.hide()
	
	rng.randomize()
	_init_colors()
