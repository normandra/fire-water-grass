extends Node3D

var water_scene = load("res://water.tscn")
var fire_scene = load("res://fire.tscn")
var grass_scene = load("res://grass.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 10:
		var water = water_scene.instantiate()
		water.position.x = randi_range(-20,20)
		water.position.z = randi_range(-20,20)
		water.setup(grass_scene, fire_scene, water_scene)
		add_child(water)
		
		var fire = fire_scene.instantiate()
		fire.position.x = randi_range(-20,20)
		fire.position.z = randi_range(-20,20)
		fire.setup(water_scene, grass_scene, fire_scene)
		add_child(fire)
		
		var grass = grass_scene.instantiate()
		grass.position.x = randi_range(-20,20)
		grass.position.z = randi_range(-20,20)
		grass.setup(fire_scene, water_scene, grass_scene)
		add_child(grass)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_R:
			get_tree().reload_current_scene()
		
		if event.pressed and event.keycode == KEY_Q:
			get_tree().quit()
