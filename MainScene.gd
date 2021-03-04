extends Node2D

var emotions_selected: Array

func _ready():
	$MainMenuPanel.show()
	$ColorsPanel.hide()
	$EmotionsPanel.hide()

#func _process(delta):
#	pass

func _on_NewImageButton_pressed():
	#$MainMenuPanel.replace_by($EmotionsPanel)
	$MainMenuPanel.hide()
	$EmotionsPanel.show()
	
func _on_GenerateButton_pressed():
	$ColorsPanel.hide()

func _on_EmotionsButton_pressed():
	$EmotionsPanel.hide()
	$ColorsPanel.show()


func _on_HomeButton_pressed():
	$EmotionsPanel.hide()
	$ColorsPanel.hide()
	$MainMenuPanel.show()
	emotions_selected.clear()
