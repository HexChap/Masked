extends Control

@onready var text_edit: TextEdit = $VBoxContainer/HBoxContainer/GridContainer/TextEdit
@export_file("*.tscn") var start_level = ""

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_button_button_up() -> void:
	var text = text_edit.text.trim_suffix("\n");
	if text.length() < 3 || text.length() > 10:
		return
	DataManager.save_player_name(1, text)
	SceneManager.swap_scenes(start_level, get_tree().root, self, Const.TRANSITION.FADE_TO_WHITE)
