extends CharacterBody3D

const SPEED = 20
var camera
#var velo = Vector3(0,0,SPEED)

func _ready():
	camera = get_node("/root/Main/Space_Camera")
	#print(camera.global_transform.origin.z)
	
func _physics_process(delta):
	velocity.z = -SPEED
	move_and_slide()
	
	if transform.origin.z < camera.global_transform.origin.x - 100:
		queue_free()
		
