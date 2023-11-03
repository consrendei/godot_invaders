extends HBoxContainer


var LIVES_RECT_PATH = preload("res://elements/ui/livesbar/lives_rect.tscn")

func _ready():
	Events.lives_changed.connect(update_lives)
	update_lives(Globals.lives)

func update_lives(lives: int):
	if lives < 0:
		return
	var diff = lives - get_child_count()
	for i in range(abs(diff)):
		add_lives() if diff > 0 else remove_lives()
	
func add_lives():
	add_child(LIVES_RECT_PATH.instantiate())

func remove_lives():
	get_child(0).queue_free()
