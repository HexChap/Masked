extends CanvasLayer


@onready var label = $Escape/VBoxContainer/HBoxContainer/GridContainer/Label

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_continue_button_up() -> void:
	label.text = ""
	queue_free()
	
func _on_settings_button_up() -> void:
	label.text = ""
	Globals.open_settings_menu()

func _on_quit_button_up() -> void:
	_on_save_button_up()
	get_tree().quit()

func _on_save_button_up() -> void:
	DataManager.save_game()
	DataManager.save_level_data()
	label.text = "Game saved!"
