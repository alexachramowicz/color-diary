extends Panel

var emotions = ["happy", "sad", "angry", "stressed", "anxious", "tired"]
var emotions_selected: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	$EmotionsList.max_columns = 1
	
	for i in range(emotions.size()):
		$EmotionsList.add_item(emotions[i], null, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
