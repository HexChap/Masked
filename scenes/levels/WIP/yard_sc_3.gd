@tool
extends Level

func move_camera():
	var tm: TargetManager = %GameCamera2D.get_node("TargetManager")
	tm.target_player_id = 0
	tm.target = %CharaBlack

func return_camera():
	var tm: TargetManager = %GameCamera2D.get_node("TargetManager")
	tm.target_player_id = 1
	tm.target = null

func move_rika():
	var path = Path2D.new()
	path.curve = load("res://scenes/levels/WIP/curve_to_toilette.tres")
	Globals.can_player_move = false
	Globals.get_player(1).follow_path(path)
	move_camera()
	
	await Globals.path_end_reached
	Globals.can_player_move = true
	var sm: StateMachine = get_node("ContainYourself/StateMachine")
	sm.enable_next_state()
	
func transition():
	SceneManager.swap_scenes("res://scenes/levels/WIP/yard-sc5.tscn", get_tree().root, self)
