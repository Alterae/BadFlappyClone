extends KinematicBody2D

var velocity := Vector2.ZERO
var strength_jump := 175.0
var gravity := 9.8
var dead := false
var score := 0

signal died(score)  # TODO reset game on player death.
signal scored(score)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dead = false
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if not dead:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -strength_jump
		else:
			velocity.y += gravity

		velocity = move_and_slide(velocity)


# Kills the player when we hit something.
# TODO: Fix game stuttering for a second or two after player dies.
func die() -> void:
	dead = true
	$Sprite.visible = false
	emit_signal("died", score)
	queue_free()


# Increments the score.
func score_increment() -> void:
	score += 1
	emit_signal("scored", score)
