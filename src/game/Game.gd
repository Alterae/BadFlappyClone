extends Node2D

var position_spawn := Vector2(512, 135)
var gate_preload := preload("res://entities/pipes/pipegate/PipeGate.tscn")
var height_max_offset := 50
var gameover := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Score.visible = true


func _input(event: InputEvent) -> void:
	if gameover:
		if event.is_action_pressed("ui_accept"):
			var _err := get_tree().reload_current_scene()
		if event.is_action_pressed("ui_cancel"):
			get_tree().quit()


# Called when the spawn timer times out.  Spawns a pipe.
func _on_SpawnTimer_timeout() -> void:
	var gate_instance := gate_preload.instance()
	gate_instance.position = position_spawn
	gate_instance.position.y += -(height_max_offset) + (randi() % (height_max_offset * 2))
	add_child(gate_instance)


func _on_Bird_scored(score: int) -> void:
	$CanvasLayer/Score.text = str(score)


func _on_Bird_died(score: int) -> void:
	$CanvasLayer/Score.visible = false
	$CanvasLayer/GameOver/Score.text = "Score: " + str(score)
	$CanvasLayer/GameOver.visible = true
	gameover = true
