extends KinematicBody2D

var velocity := Vector2.ZERO
var strength_jump := 200.0
var gravity := 9.8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -strength_jump
	else:
		velocity.y += gravity

	velocity = move_and_slide(velocity)
