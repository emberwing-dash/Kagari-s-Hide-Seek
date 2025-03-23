extends CharacterBody3D

# Player Animation
@onready var animation_player = $Visuals/koratouAnim/AnimationPlayer

@onready var visuals = $Visuals

# Attacks
var isAttacking = false
var isJumping = false

var SPEED = 2.8
const JUMP_VELOCITY = 4.5

#mouse
@export var sens_horizontal = 0.5
@export var sens_vertical = 0.5
@onready var camera_mount = $camera_mount

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Mouse capture
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if(event is InputEventMouseMotion):
		rotate_y(deg_to_rad(-event.relative.x * sens_horizontal))
		visuals.rotate_y(deg_to_rad(event.relative.x * sens_horizontal))
		camera_mount.rotate_x(deg_to_rad(-event.relative.y * sens_vertical))

func _physics_process(delta):
	#print(position)
	# escape loop
	
	
	# check attack
	if Input.is_action_pressed("attack"):
		isAttacking = true
	
	if isAttacking:
		animation_player.play("kick")
		isAttacking=false
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		isJumping = true 
	
	if isJumping:
		#animation_player.play("jumped")
		#await animation_player.animation_finished
		isJumping = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	#SPINT check
	if Input.is_action_pressed("sprint"):
		SPEED = 5
	else:
		SPEED = 2.8
	
	if direction:
		if animation_player.current_animation!="walking" and SPEED<=2.8 and animation_player.current_animation!="kick" and animation_player.current_animation!="jumped":
			animation_player.play("walking")
		if animation_player.current_animation!="running" and SPEED>2.8 and animation_player.current_animation!="kick" and animation_player.current_animation!="jumped":
			animation_player.play("running")
			
		visuals.look_at(position + direction) # look at direction
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		if animation_player.current_animation!="idle" and animation_player.current_animation!="kick" and animation_player.current_animation!="jump":
			animation_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
