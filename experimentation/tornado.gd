extends MeshInstance3D


@export var rotation_speed: float

func _physics_process(delta: float) -> void:
    rotate_y(rotation_speed * delta)