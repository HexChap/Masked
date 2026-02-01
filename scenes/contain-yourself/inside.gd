extends RigidBody2D

@export var speed := 400.0
const LIMIT := 222.0

var initial_local_pos: Vector2

func _ready() -> void:
	initial_local_pos = position
	lock_rotation = true

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	# INPUT
	var dir := Input.get_axis("move_left", "move_right")
	var velocity := state.linear_velocity
	velocity.x = dir * speed

	# PARENT GLOBAL POSITION
	var parent_pos := Vector2.ZERO
	if get_parent():
		parent_pos = get_parent().global_position

	# CURRENT POSITION (IMPORTANT: preserve Y)
	var pos := state.transform.origin

	# FORCE Y (initial Y + 10px)
	pos.y = parent_pos.y + initial_local_pos.y

	# X LIMITS (relative to parent)
	var min_x := parent_pos.x + initial_local_pos.x - LIMIT
	var max_x := parent_pos.x + initial_local_pos.x + LIMIT

	if pos.x < min_x:
		pos.x = min_x
		if velocity.x < 0:
			velocity.x = 0
	elif pos.x > max_x:
		pos.x = max_x
		if velocity.x > 0:
			velocity.x = 0

	# WRITE BACK (all axes preserved)
	var t := state.transform
	t.origin = pos
	state.transform = t
	state.linear_velocity = velocity
