extends Node3D

@onready var bullet_spawner : Node3D = get_node("BulletSpawner")
@onready var tornado : MeshInstance3D = get_node("Tornado")
var tornado_mat

@export var alpha_curve : Curve
@export var tornado_lifetime : float = 6.0
@export var delay_fire : float

func _ready() -> void:

	tornado_mat = tornado.mesh.material
	get_tree().create_timer(2).timeout.connect(play_attack)

func play_attack():
	tornado.scale = Vector3(0.1, 0.8, 0.1)
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(tornado, "scale", Vector3.ONE, 2).set_trans(Tween.TRANS_QUAD)
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_method(
		func(value):
			tornado_mat.set_shader_parameter("b_alpha", alpha_curve.sample(value)),
		0.0, 1.0, tornado_lifetime
	)
	get_tree().create_timer(delay_fire, false, true).timeout.connect(bullet_spawner.fire_spawner)
