class_name Wave extends RefCounted

var x_scale: float = 0.01 
var base_y: float = 200.0
var amplitude: float = 50.0
var frequency: float = 1.0
var phase: float = 0.0

func get_y_at_x(x: float) -> float:
	return base_y + amplitude * sin((x * x_scale * frequency) + phase)

func get_points(from_x: float, to_x: float, step: float) -> Array[Vector2]:
	var pts: Array[Vector2] = []
	var x := from_x
	while x <= to_x:
		pts.append(Vector2(x, get_y_at_x(x)))
		x += step
	return pts
