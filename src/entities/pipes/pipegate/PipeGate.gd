extends Node2D

var size_gap := 50.0  # TODO: Set up random or difficulty/based variation.
var speed := 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TopSegment.position.y -= size_gap / 2
	$BottomSegment.position.y += size_gap / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if position.x < -32:
		queue_free()  # Delete the gate when it leaves the screen.


func _physics_process(delta: float) -> void:
	position.x = lerp(position.x, position.x - speed, speed * delta)


func _on_ScoreDetector_body_entered(body: Node) -> void:
	if body.has_method("score_increment"):
		body.score_increment()
