extends CharacterBody2D


const PLAYER_BULLET_PATH = preload("res://elements/player_bullet/player_bullet.tscn")
const SPEED = 300.0

func _physics_process(delta: float):
	if Input.is_action_just_pressed("ui_accept"):
		shot()
	
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	move_and_slide()

func shot():
	var player = PLAYER_BULLET_PATH.instantiate()
	player.global_position = global_position + Vector2(0, -14)
	
	add_child(player)

func take_damage():
	Globals.change_lives(-1)
