extends Area3D
const TREE = preload("res://scenes/tree.tscn")

#positions
@onready var point_1 = $RandomPoints/point1
@onready var point_2 = $RandomPoints/point2
@onready var point_3 = $RandomPoints/point3
@onready var point_4 = $RandomPoints/point4

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	#random number
	var a=rng.randi_range(1,3)
	var b=rng.randi_range(2,5)
	
	if a==1:
		instTree(point_1.position)
		
	if a==2:
		instTree(point_2.position)
		
	if b==3:
		instTree(point_3.position)
	
	if b==4:
		instTree(point_4.position)

func vectorPos():
	pass

func instTree(pos):
	var instance = TREE.instantiate()
	instance.position = pos 
	
	add_child(instance)
