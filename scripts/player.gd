extends CharacterBody2D

const moveSpeed = 30
const maxSpeed = 60

const jumHeight = -300
const gravity = 15

var sprite
var animationPlayer


func _ready():
	sprite = $Sprite2D
	animationPlayer = $AnimationPlayer
	

func _physics_process(delta):
	velocity.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("walk")
		motion_ctrl()
		
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("walk")
		motion_ctrl()
		
	else:
		animationPlayer.play("idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = jumHeight
		if friction == true:
			velocity.x = lerp(velocity.x, 0.0, 0.5)
	else:
		if friction == true: 
			velocity.x = lerp(velocity.x, 0.0, 0.01)
	
	move_and_slide()


func motion_ctrl():
	velocity.x = GLOBAL.get_axis().x * maxSpeed

func add_Coin():
	var canvasLayer = get_tree().get_root().find_child("UI", true, false)
	canvasLayer.handleCoinCollected()


func _on_spike_body_entered(body):
	if (body.get_name() == "Player"):
		print("mepinche")
		call_deferred("perdiste")


func perdiste():
	get_tree().reload_current_scene()
