extends CharacterBody3D

var speed: int = 12
var one_s: PackedScene
var two_s: PackedScene
var three_s: PackedScene

func setup(one, two, three):
	one_s = one
	two_s = two
	three_s = three

func _ready():
	velocity.x = speed
	var rotated_speed = Vector2(velocity.x, velocity.z).rotated(randf_range(0,2 * PI))
	velocity.x = rotated_speed.x
	velocity.z = rotated_speed.y

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


func _on_area_3d_area_entered(area):
	
	var new = one_s.instantiate()
	new.setup(two_s, three_s, one_s)
	new.position = position
	
	get_parent().add_child(new)
	queue_free()
