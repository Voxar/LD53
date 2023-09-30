extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED | Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Release Mouse Capture"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.is_action_just_pressed("Next camera"):
		var cams = find_children("Camera3D", "Camera3D", true)
		var found = false
		cams.append_array(cams)
		for cam in cams: 
			var acam = cam as Camera3D
			if found and !acam.current: 
				acam.make_current()
				break
			else:
				found = true
	
	if Input.mouse_mode & Input.MOUSE_MODE_CAPTURED:
		var center = get_viewport().size / 2;
		Input.warp_mouse(center)
