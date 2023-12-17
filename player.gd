extends CharacterBody3D

const MAXSPEED = 30
const ACCELERATION = 0.075

var inputVector = Vector3()


func _physics_process(delta):
	inputVector.x = Input.get_action_strength("space_left") - Input.get_action_strength("space_right")
	inputVector.y = Input.get_action_strength("space_up") - Input.get_action_strength("space_down")
	inputVector = inputVector.normalized()
	#print(inputVector)
	
	velocity.x = lerp(velocity.x, inputVector.x * MAXSPEED, ACCELERATION)  
	velocity.y = lerp(velocity.y, inputVector.y * MAXSPEED, ACCELERATION)  
	rotation_degrees.z = velocity.x * -2
	rotation_degrees.x = velocity.y / 2  # Corrected division
	rotation_degrees.y = -velocity.x /2 
	#print(velo)
	move_and_slide()
	transform.origin.x = clamp(transform.origin.x, -30, 10)
	transform.origin.y = clamp(transform.origin.y, -30, 10)
