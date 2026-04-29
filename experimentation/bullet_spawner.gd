extends Node3D

#spawn pattern
#pattern reveal
#homing
#projectile speed
#orient z
#trajectory
#repeating
#firework
#firing direction

@export var bullet_scene : PackedScene
var player

var fire_direction : Vector3 = Vector3.FORWARD.rotated(Vector3.UP, randf_range(0, 2*PI))
@export var spawn_offset : Vector3 = Vector3.DOWN * 2.0
@export var fire_velocity : float = 10
@export var bullet_amount : int = 56
@export var fire_velocity_ramp : float = 0.05
@export var fire_direction_rotation : float= deg_to_rad(23.5)
@export var firing_interval : float = 0.05

func _ready() -> void:
    player = get_tree().get_first_node_in_group("Player")
    print(player)

func fire_spawner(_args : Array = []):
    bullet_tornado()

func bullet_tornado():
    var tween = create_tween()
    tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
    for i in bullet_amount:
        tween.chain().tween_callback(
            func():
                var instance : RigidBody3D = bullet_scene.instantiate()
                add_child(instance)
                instance.position += fire_direction + spawn_offset
                instance.apply_impulse(fire_direction * fire_velocity)
                
                fire_direction = fire_direction.rotated(Vector3.UP, fire_direction_rotation)
                fire_velocity += fire_velocity_ramp
        )
        tween.chain().tween_interval(firing_interval)



