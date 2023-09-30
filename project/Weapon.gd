class_name Weapon extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
		
func is_ready():
	return !$AnimationPlayer.is_playing()
		
func shoot():
	$AnimationPlayer.play("Weapon_fire")
	$Sound.play()
