extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	position = Vector2(100,100)
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x += -220 * delta
	if Input.is_action_pressed("ui_right"):
		position.x += 220 * delta	
	if Input.is_action_pressed("ui_up"):
		position.y += -220 * delta
	if Input.is_action_pressed("ui_down"):
		position.y += 220 * delta

	position.x = clamp(position.x, 0,480)
	position.y = clamp(position.y, 0,720)
	
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite.play("run")
		
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("run")
		
	else:
		$AnimatedSprite.play("idle")	
		
	
	


func _on_player_area_entered(area):
	if area.is_in_group("gem"):
		area.pickup()
		$AudioStreamPlayer.play()
