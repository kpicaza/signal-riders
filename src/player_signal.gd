class_name PlayerSignal
extends RefCounted

var y: float = 0.0

func is_inside_band(band: WaveBand) -> bool:
	return y >= band.top and y <= band.bottom

func move_towards(target_y: float, speed: float, delta: float) -> void:
	if y < target_y:
		y = min(y + speed * delta, target_y)
	elif y > target_y:
		y = max(y - speed * delta, target_y)

func apply_input(dir: float, speed: float, delta: float) -> void:
	y += dir * speed * delta

func clamp_to_band(band: WaveBand) -> bool:
	var collided := false

	if y < band.top:
		y = band.top
		collided = true
	elif y > band.bottom:
		y = band.bottom
		collided = true

	return collided
