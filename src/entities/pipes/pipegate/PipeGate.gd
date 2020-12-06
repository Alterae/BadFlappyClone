extends Node2D

var size_gap := 32.0  # TODO: Set up random or difficulty/based variation.
onready var segment_top := $TopSegment
onready var segment_bottom := $BottomSegment


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	segment_top.position.y -= size_gap / 2
	segment_bottom.position.y += size_gap / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
