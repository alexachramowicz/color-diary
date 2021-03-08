extends Node2D


var emotions_chosen: Array


func _ready():
	
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
	$EmotionsPanel.hide()
	$ColorsPanel.hide()
	$ImagePanel.hide()
	$MainMenuPanel.hide()
	$DiaryPanel.show()
	pass
