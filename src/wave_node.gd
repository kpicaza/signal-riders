extends Node2D

var wave := Wave.new()

func _ready():
	wave.base_y = 300

func _draw():
	var width := get_viewport_rect().size.x
	var pts := wave.get_points(0.0, width, 8.0)
	for i in range(pts.size() - 1):
		draw_line(pts[i], pts[i+1], Color.WHITE, 3.0)

func _process(delta):
	wave.phase -= delta
	queue_redraw()
