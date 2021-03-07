extends Panel


func _ready():
	$DiaryItemlist.max_columns = 4
	
	for i in range(4):
		$DiaryItemlist.add_item("test")
