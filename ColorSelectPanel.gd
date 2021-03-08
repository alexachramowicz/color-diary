extends Panel

var pool_colors: PoolColorArray
var select_colors: PoolColorArray
var select: bool
var rng = RandomNumberGenerator.new()


# main
func _ready():
	$ColorSelectContainer.hide()
	
	select = false
	
	rng.randomize()
	_init_colors()
	
	for i in range(4):
		select_colors.append(Color(0,0,0,0))


#func _process(delta):


func _init_colors():

	for i in range(4):
		pool_colors.append(Color(rng.randf(), rng.randf(), rng.randf(), rng.randf()))
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
		select = true # if select is true, pull color from select_colors
	else:
		$ColorSelectContainer.hide()
		$ColorOptionsContainer.show()
		$RegenerateContainer.show()
		$ColorOptionsLabel.show()
		select = false # if false, pull color from pool_colors
		
	print(select) # debug


func _on_Button1_pressed():
	pool_colors[0] = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())
	$ColorOptionsContainer/MarginContainer/ColorRect.color = pool_colors[0]


func _on_Button2_pressed():
	pool_colors[1] = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())
	$ColorOptionsContainer/MarginContainer2/ColorRect.color = pool_colors[1]


func _on_Button3_pressed():
	pool_colors[2] = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())
	$ColorOptionsContainer/MarginContainer3/ColorRect.color = pool_colors[2]


func _on_Button4_pressed():
	pool_colors[3] = Color(rng.randf(), rng.randf(), rng.randf(), rng.randf())
	$ColorOptionsContainer/MarginContainer4/ColorRect.color = pool_colors[3]


func _on_ColorPickerButton_color_changed(color):
	select_colors.set(0, color)


func _on_ColorPickerButton2_color_changed(color):
	select_colors.set(1, color)


func _on_ColorPickerButton3_color_changed(color):
	select_colors.set(2, color)


func _on_ColorPickerButton4_color_changed(color):
	select_colors.set(3, color)


func _on_HomeButton_pressed():
	for i in range(4):
		pool_colors.set(i, Color(rng.randf(), rng.randf(), rng.randf(), rng.randf()))
		print(pool_colors[i])
	
	$ColorOptionsContainer/MarginContainer/ColorRect.color = pool_colors[0]
	$ColorOptionsContainer/MarginContainer2/ColorRect.color = pool_colors[1]
	$ColorOptionsContainer/MarginContainer3/ColorRect.color = pool_colors[2]
	$ColorOptionsContainer/MarginContainer4/ColorRect.color = pool_colors[3]
	
#	$ColorSelectLabel/ColorSelectButton.toggle_mode = false
#	$ColorSelectContainer.hide()
#	$RegenerateContainer.show()
#	$ColorOptionsContainer.show()
