extends Node2D

var wave: Wave = Wave.new()

func _ready():
	var h := get_viewport_rect().size.y
	wave.base_y = h * 0.5
	wave.thickness = 60.0

func _process(delta):
	wave.phase -= delta * 2.0
	queue_redraw()

func _draw():
	var width := get_viewport_rect().size.x
	var step := 8.0

	var prev_top: Vector2
	var prev_bottom: Vector2
	var first := true

	var x := 0.0
	while x <= width:
		var band := wave.get_band_at_x(x)
		var top := Vector2(x, band.top)
		var bottom := Vector2(x, band.bottom)

		if not first:
			draw_line(prev_top, top, Color.WHITE, 2.0)
			draw_line(prev_bottom, bottom, Color.WHITE, 2.0)
		else:
			first = false

		prev_top = top
		prev_bottom = bottom
		x += step
