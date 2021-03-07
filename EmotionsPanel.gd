extends Panel

var emotions = ["happy", "sad", "anxious", "satisfied", "alert", "hopeful", "amused", 
"prideful", "angry", "disgusted", "grateful", "guilty", "fearful", "offended",
"indifferent", "betrayed", "contemptful", "ecstatic", "euphoric", "lonely", "tired",
"melancholy", "loving", "confident", "trusting", "weak", "excited", "cool", "pleasant",
"positive", "negative", "neutral"]
var emotions_selected: Array


func _ready():
	$EmotionsList.max_columns = 1
	
	for i in range(emotions.size()):
		$EmotionsList.add_item(emotions[i], null, true)


#func _process(delta):


func _on_EmotionsList_multi_selected(index, selected):
	var list
	
	if(selected == true): # insert
		if(emotions_selected.find(emotions[index]) == -1):
			emotions_selected.append(emotions[index])
		else:
			pass
	else: # pop
		emotions_selected.erase(emotions[index])
	
	list = PoolStringArray(emotions_selected).join(", ")
		
	$EmotionsSelectedLabel.set_text(list)


func _on_HomeButton_pressed():
	emotions_selected.clear()
