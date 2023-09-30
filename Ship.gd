extends RigidBody3D

# 1000 is a good warp speed
var thrust_forward = 10;
var thrust_backward = 10
var thrust_left = 5;
var thrust_right = 5
var thrust_up = 5;
var thrust_down = 5
var roll_speed_left = .5
var roll_speed_right = .5

var mouse_sens = Vector2(0.05, 0.05)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func thrust(f, dir):
	dir = self.transform.basis * dir
	apply_force(dir * f)
	
func roll(f, axis):
	axis = self.transform.basis * axis
	apply_torque(axis * f)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("W"):
		self.thrust(thrust_forward, Vector3.FORWARD)
	if Input.is_action_pressed("S"): 
		self.thrust(thrust_backward, -Vector3.FORWARD)
		
	if Input.is_action_pressed("A"):
		self.thrust(thrust_left, Vector3.LEFT)
	if Input.is_action_pressed("S"): 
		self.thrust(thrust_right, Vector3.RIGHT)
	
	if Input.is_action_pressed("Space"):
		self.thrust(thrust_up, Vector3.UP)
	if Input.is_action_pressed("C"): 
		self.thrust(thrust_down, Vector3.DOWN)

	if Input.is_action_pressed("Q"):
		self.roll(roll_speed_left, -Vector3.FORWARD)
	if Input.is_action_pressed("E"): 
		self.roll(roll_speed_right, Vector3.FORWARD)
	
	
func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		var md = event.relative * mouse_sens
		self.roll(md.x, -Vector3.UP)
		self.roll(md.y, Vector3.LEFT)
