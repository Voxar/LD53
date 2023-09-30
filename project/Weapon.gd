class_name Weapon extends Node3D

var Projectile_prefab = preload("res://Projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass		
		
		
func is_ready():
	return !$AnimationPlayer.is_playing()
		
func shoot(ignore_collision: RigidBody3D):
	$AnimationPlayer.play("Weapon_fire")
	$Sound.play()
	var bullet = Projectile_prefab.instantiate()
	var barrel = $Barrel as Node3D
	
	bullet.global_transform = barrel.global_transform
	bullet.add_collision_exception_with(ignore_collision)
	bullet.apply_impulse(bullet.basis.y * 100)

	var parent = get_tree().root
	parent.add_child(bullet)
	await get_tree().create_timer(1.0).timeout
	parent.remove_child(bullet)
	bullet.queue_free()
