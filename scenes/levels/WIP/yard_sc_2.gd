@tool
extends Level

func transition():
	SceneManager.swap_scenes("res://scenes/levels/WIP/yard-sc3.tscn", get_tree().root, self)
