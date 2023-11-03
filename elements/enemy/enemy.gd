extends CharacterBody2D


const ENEMY_BULLET_PATH = preload("res://elements/enemy_bullet/enemy_bullet.tscn")

@onready var raycast_left := $RayCastLeft
@onready var raycast_right := $RayCastRight

func _physics_process(delta):
	if raycast_left.is_colliding() or raycast_right.is_colliding():
		get_tree().call_group("enemy_group", "change_direction")

func destroy():
	Globals.change_points(1)
	Events.enemy_died.emit()
	queue_free()

func shot():
	print("shot")
	var enemy_bullet = ENEMY_BULLET_PATH.instantiate()
	enemy_bullet.global_position += global_position + Vector2(0, 10.0)
	add_child(enemy_bullet)
	
