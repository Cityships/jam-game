extends CanvasLayer

@onready var pause_display : Control

var toggle_mouse_capture : bool:
	set(value):
		toggle_mouse_capture = value
		if toggle_mouse_capture:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause_game"):
		get_tree().paused = !get_tree().paused
		pause_display.visible = !pause_display.visible
	if Input.is_action_just_pressed("toggle_mouse_capture"):
		toggle_mouse_capture = !toggle_mouse_capture
