class_name Wave extends RefCounted

var x_scale: float = 0.01 
var base_y: float = 100.0
var amplitude: float = 50.0
var frequency: float = 1.0
var phase: float = 0.0
var thickness: float = 40.0
var min_thickness: float = 4.0    # grosor al nacer

var spawn_y: float = 200.0
var spawn_static_len: float = 40.0
var spawn_blend_len: float = 40.0

func get_y_at_x(x: float) -> float:
	var real_y := base_y + amplitude * sin((x * x_scale * frequency) + phase)

	if x >= spawn_blend_len:
		return real_y

	var t := x / spawn_blend_len
	var eased := t * t
	return lerp(spawn_y, real_y, eased)

func get_points(from_x: float, to_x: float, step: float) -> Array[Vector2]:
	var pts: Array[Vector2] = []
	var x := from_x
	while x <= to_x:
		pts.append(Vector2(x, get_y_at_x(x)))
		x += step
	return pts

func get_band_at_x(x: float) -> WaveBand:
	var center_y := get_y_at_x(x)
	var eff_thickness := thickness

	if x < spawn_blend_len:
		var t := x / spawn_blend_len
		var eased := t * t
		eff_thickness = lerp(min_thickness, thickness, eased)

	var half := eff_thickness * 0.5
	return WaveBand.new(center_y - half, center_y, center_y + half)
