@tool
extends Level

func simulate_transition():
	SceneManager.swap_scenes(self.scene_file_path)
