@tool
extends Node3D

@export_range(1, 100) var rope_length : float = 1.0

@onready var rope : MeshInstance3D = get_node("Rope")
var rope_mesh
@onready var rope_outline : MeshInstance3D = get_node("RopeOutline")
var rope_outline_mesh

@export var mesh_truth : CylinderMesh