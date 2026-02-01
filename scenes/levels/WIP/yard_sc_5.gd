@tool
extends "res://scenes/levels/WIP/yard_sc_2.gd"

func start_ending():
	%StateMachine.disable_state(%StateMachine.current_state)
	print(Globals.reputation)
	if Globals.reputation >= -2:
		%StateMachine.enable_state(%StateMachine.get_node("StateDialogue"))
	else:
		%StateMachine.enable_state(%StateMachine.get_node("StateDialogue2"))
