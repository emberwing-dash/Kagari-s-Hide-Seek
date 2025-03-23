extends CharacterBody3D
@onready var animation_player = $kagariAnim/AnimationPlayer


#Spawn Areas
@onready var spawn_area = $"../AreaList/SpawnArea"
@onready var spawn_area_2 = $"../AreaList/SpawnArea2"
@onready var spawn_area_3 = $"../AreaList/SpawnArea3"
@onready var spawn_area_4 = $"../AreaList/SpawnArea4"
@onready var spawn_area_5 = $"../AreaList/SpawnArea5"
@onready var spawn_area_6 = $"../AreaList/SpawnArea6"
@onready var spawn_area_7 = $"../AreaList/SpawnArea7"
@onready var spawn_area_8 = $"../AreaList/SpawnArea8"
@onready var spawn_area_9 = $"../AreaList/SpawnArea9"
@onready var spawn_area_10 = $"../AreaList/SpawnArea10"
@onready var spawn_area_11 = $"../AreaList/SpawnArea11"
@onready var spawn_area_12 = $"../AreaList/SpawnArea12"
@onready var spawn_area_13 = $"../AreaList/SpawnArea13"
@onready var spawn_area_14 = $"../AreaList/SpawnArea14"
@onready var spawn_area_15 = $"../AreaList/SpawnArea15"
@onready var spawn_area_16 = $"../AreaList/SpawnArea16"
@onready var spawn_area_17 = $"../AreaList/SpawnArea17"
@onready var spawn_area_18 = $"../AreaList/SpawnArea18"
@onready var spawn_area_19 = $"../AreaList/SpawnArea19"
@onready var spawn_area_20 = $"../AreaList/SpawnArea20"


var offset1 = Vector3(-2,0,0)
var offset2 = Vector3(2,0,0)
var offset3 = Vector3(0,0,2)
var offset4 = Vector3(0,0,-2)

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	
	#random number
	var a=rng.randi_range(1,21)
	var b=rng.randi_range(1,5)
	
	var offset = offsetPick(b)
	
	var positionKagari = posWhere(a)
	print(positionKagari * 2)
	print(a)
	
	randomPositioning(positionKagari * 2)



# Called every frame. 'delta' ivar rng = RandomNumberGenerator.new()s the elapsed time since the previous frame.
func _process(delta):
	animation_player.play("wave")
	



func _on_key_area_body_entered(body):
	print("You caught kagari!")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/loop.tscn")

func randomPositioning(pos):
	self.position = pos
	
func offsetPick(num):
	if num==1:
		return offset1
	if num==2:
		return offset2
	if num==3:
		return offset3 
	if num==4:
		return offset4
	
func posWhere(randNum):
	var point = null  # Default to null to handle missing points
	
	# Check which point to use
	if randNum == 1:
		point = spawn_area.position
	elif randNum == 2:
		point = spawn_area_2.position
	elif randNum == 3:
		point = spawn_area_3.position
	elif randNum == 4:
		point = spawn_area_4.position
	elif randNum == 5:
		point = spawn_area_5.position
	elif randNum == 6:
		point = spawn_area_6.position
	elif randNum == 7:
		point = spawn_area_7.position
	elif randNum == 8:
		point = spawn_area_8.position
	elif randNum == 9:
		point = spawn_area_9.position
	elif randNum == 10:
		point = spawn_area_10.position
	elif randNum == 11:
		point = spawn_area_11.position
	elif randNum == 12:
		point = spawn_area_12.position
	elif randNum == 13:
		point = spawn_area_13.position
	elif randNum == 14:
		point = spawn_area_14.position
	elif randNum == 15:
		point = spawn_area_15.position
	elif randNum == 16:
		point = spawn_area_16.position
	elif randNum == 17:
		point = spawn_area_17.position
	elif randNum == 18:
		point = spawn_area_18.position
	elif randNum == 19:
		point = spawn_area_19.position
	elif randNum == 20:
		point = spawn_area_20.position

	return point
