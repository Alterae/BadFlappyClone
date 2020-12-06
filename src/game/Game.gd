extends Node2D

var position_spawn := Vector2(512, 135)
var gate_preload := preload("res://entities/pipes/pipegate/PipeGate.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


# Called when the spawn timer times out.  Spawns a pipe.
func _on_SpawnTimer_timeout() -> void:
	var gate_instance := gate_preload.instance()
	gate_instance.position = position_spawn
	gate_instance.position.y += -100 + (randi() % 200)  # SHOULD give a random offset.
	add_child(gate_instance)
