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

func _ready() -> void:
    player = get_tree().get_first_node_in_group("Player")
    print(player)

