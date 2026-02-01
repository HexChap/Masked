extends DialogueManagerExampleBalloon
## An extension of the basic dialogue balloon for use with Dialogue Manager.

## The container for the name label.
@onready var name_container: Panel = $Balloon/NameContainer
@onready var charecter_rect: TextureRect = $TextureRect


var emotion_prefixes = ["[neutral]", "[mad]", "[happy]"]
var character_sprites = {
	"Main": {
		"[neutral]": preload("res://charecter_textures/main/main_neutral.png"),
		"[mad]": preload("res://charecter_textures/main/main_mad.png"),
	},
	"Steve": {
		"[neutral]": preload("res://charecter_textures/steve/steve_neutral.png"),
		"[mad]": preload("res://charecter_textures/steve/steve_mad.png"),
		"[happy]": preload("res://charecter_textures/steve/steve_happy.png"),
	},
	"Amanda": {
		"[neutral]": preload("res://charecter_textures/amanda/amanda_neutral.png"),
		"[mad]": preload("res://charecter_textures/amanda/amanda_mad.png"),
		"[happy]": preload("res://charecter_textures/amanda/amanda_happy.png"),
	},
	"Eloise": {
		"[neutral]": preload("res://charecter_textures/eloise/eloise_neutral.png"),
		"[mad]": preload("res://charecter_textures/eloise/eloise_mad.png"),
		"[happy]": preload("res://charecter_textures/eloise/eloise_happy.png"),
	},
	"Ilya": {
		"[neutral]": preload("res://charecter_textures/ilya/Ilya_neutral.png"),
		"[mad]": preload("res://charecter_textures/ilya/Ilya_mad.png"),
		"[happy]": preload("res://charecter_textures/ilya/Ilya_happy.png"),
	},
	"Lara": {
		"[neutral]": preload("res://charecter_textures/lara/lara_neutral.png"),
		"[mad]": preload("res://charecter_textures/lara/lara_mad.png"),
		"[happy]": preload("res://charecter_textures/lara/lara_happy.png"),
	}
}

## Apply any changes to the balloon given a new [DialogueLine].
func apply_dialogue_line() -> void:
	var char_name = dialogue_line.character
	
	if char_name == Globals.player_name:
		char_name = "Main"
	
	var current_emotion = "[neutral]"
	for prefix in emotion_prefixes:
		if dialogue_line.text.begins_with(prefix):
			current_emotion = prefix
			dialogue_line.text = dialogue_line.text.trim_prefix(prefix).strip_edges()
			break
			
	update_portrait(char_name, current_emotion)
	
	if char_name.is_empty():
		name_container.visible = false
		charecter_rect.texture = null
	super.apply_dialogue_line()

func update_portrait(c_name: String, emotion: String) -> void:
	if character_sprites.has(c_name):
		var emotions = character_sprites[c_name]
		if emotions.has(emotion):
			charecter_rect.texture = emotions[emotion]
		else:
			charecter_rect.texture = emotions["[neutral]"]
