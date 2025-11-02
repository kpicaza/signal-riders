class_name WaveView extends RefCounted

var wave: Wave

func get_points_for_width(width: float, step: float) -> Array[Vector2]:
	assert(wave != null)
	return wave.get_points(0.0, width, step)
