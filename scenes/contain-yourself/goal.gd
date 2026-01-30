extends Sprite2D

@export var move_distance = 50
@export var move_time = .5

func _ready() -> void:
	randomize()
	
func _on_timer_timeout() -> void:
	var direction = [-1,1].pick_random()
	var target_pos = position
	target_pos.x += direction * move_distance
	
	if direction != 0:
		create_tween().tween_property(
			self, "position", clamp(target_pos, Vector2(-222, 0), Vector2(222, 0)), move_time
		)
