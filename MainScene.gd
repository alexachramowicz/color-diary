extends Node2D


var emotions_chosen: Array
var colors_chosen: PoolColorArray


func _ready():
	
	var date = OS.get_date()
	var current_date = String(date.month) + "/" + String(date.day) + "/" + String(date.year)
	print(current_date)
	
	$MainMenuPanel.show()
	$DiaryPanel.hide()
	$ColorsPanel.hide()
	$EmotionsPanel.hide()
	$ImagePanel.hide()


#func _process(delta):

#mainmenu
func _on_NewImageButton_pressed():
	$MainMenuPanel.hide()
	$EmotionsPanel.show()
	

#emotionspanel
func _on_EmotionsButton_pressed():
	$EmotionsPanel.hide()
	$ColorsPanel.show()

#colorspanel
func _on_GenerateButton_pressed():
	$ColorsPanel.hide()
	
#	var sel = get_node("ColorsPanel").select
#
#	if(sel):
#		print("select")
#		colors_chosen = get_node("ColorsPanel").select_colors
#	else:
#		print("pool")
#		colors_chosen = get_node("ColorsPanel").pool_colors
#
#	for i in range(colors_chosen.size()): # debug
#		print(colors_chosen[i])
		
	$ImagePanel.show()
	

#homebutton
func _on_HomeButton_pressed():
	$EmotionsPanel.hide()
	$ColorsPanel.hide()
	$DiaryPanel.hide()
	$ImagePanel.hide()
	$MainMenuPanel.show()
	
	$EmotionsPanel/EmotionsSelectedLabel.set_text("")
	$EmotionsPanel/EmotionsList.unselect_all()
	emotions_chosen = get_node("EmotionsPanel").emotions_selected


func _on_DiaryButton_pressed():
	$MainMenuPanel.hide()
	$DiaryPanel.show()


func _on_SaveButton_pressed():
	#get_node("ImagePanel/ImageControl/ViewportContainer/Viewport/GeneratedImagePanel")
	pass
