class_name WaveBand extends RefCounted

var top: float
var center: float
var bottom: float

func _init(wave_top: float, wave_center: float, wave_bottom: float) -> void:
	top = wave_top
	center = wave_center
	bottom = wave_bottom

func get_height() -> float:
	return bottom - top
