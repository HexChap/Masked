extends Node2D

@export var drain_rate: float = 7.0        # how fast it drains per tick
@export var recover_rate: float = 10.0     # how fast it recovers per tick
@export var survive_time: float = 8.0      # seconds needed to win

signal contain_yourself_win
signal contain_yourself_lose

var is_on_bar := false
var time_alive := 0.0

func _ready() -> void:
	$TextureProgressBar.max_value = 100.0
	$TextureProgressBar.value = 100.0

func start_game() -> void:
	Globals.can_player_move = false
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = true
	time_alive = 0.0
	$TextureProgressBar.value = 100.0

func end_game() -> void:
	Globals.can_player_move = true
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false

func _on_area_2d_body_entered(_body: Node2D) -> void:
	is_on_bar = true

func _on_area_2d_body_exited(_body: Node2D) -> void:
	is_on_bar = false

func _on_timer_timeout() -> void:
	if is_on_bar:
		$TextureProgressBar.value += recover_rate
	else:
		$TextureProgressBar.value -= drain_rate

	$TextureProgressBar.value = clamp($TextureProgressBar.value, 0.0, 100.0)

	# lose
	if $TextureProgressBar.value <= 0.0:
		end_game()
		%StateMachine.disable_state(%StateMachine.current_state)
		%StateMachine.enable_state_by_name("foo")
		contain_yourself_lose.emit()
		return

	time_alive += $Timer.wait_time
	# win
	if time_alive >= survive_time:
		end_game()
		contain_yourself_win.emit()
