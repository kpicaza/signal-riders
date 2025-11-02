extends GutTest

func test_wave_returns_base_when_amp_zero():
	var wave := Wave.new()
	wave.base_y = 200
	wave.amplitude = 0
	var y = wave.get_y_at_x(100)
	assert_eq(y, 200.0)

func test_wave_changes_with_phase():
	var wave := Wave.new()
	wave.base_y = 200
	wave.amplitude = 50
	wave.frequency = 1.0

	var y1 = wave.get_y_at_x(100)
	wave.phase = 1.0
	var y2 = wave.get_y_at_x(100)

	assert_ne(y1, y2)

func test_wave_points_have_expected_length():
	var wave := Wave.new()
	var points := wave.get_points(0.0, 800.0, 10.0)
	assert_eq(points.size(), 81)

func test_wave_points_follow_formula():
	var wave := Wave.new()
	wave.base_y = 200
	wave.amplitude = 30
	var points := wave.get_points(0.0, 100.0, 50.0)
	assert_eq(points[0].y, wave.get_y_at_x(0.0))
	assert_almost_eq(points[1].y, wave.get_y_at_x(50.0), 1.0)
	assert_almost_eq(points[2].y, wave.get_y_at_x(100.0), 1.0)

func test_wave_with_scale_is_smoother():
	var wave := Wave.new()
	wave.x_scale = 0.01
	var y1 = wave.get_y_at_x(0)
	var y2 = wave.get_y_at_x(10)
	assert_lt(abs(y2 - y1), wave.amplitude)

func test_wave_returns_band_with_configured_thickness():
	var wave := Wave.new()
	wave.thickness = 40.0
	var band := wave.get_band_at_x(100.0)
	assert_eq(band.get_height(), 40.0)
	assert_eq(band.center, wave.get_y_at_x(100.0))

func test_wave_reaches_real_wave_after_static_plus_blend():
	var w := Wave.new()
	w.base_y = 220.0
	w.amplitude = 0.0
	w.spawn_y = 200.0
	w.spawn_static_len = 40.0
	w.spawn_blend_len = 40.0

	var y := w.get_y_at_x(80.0)
	assert_eq(y, 220.0)

func test_wave_starts_thin_and_at_spawn_y():
	var w := Wave.new()
	w.base_y = 200.0
	w.spawn_y = 200.0
	w.spawn_blend_len = 80.0
	w.thickness = 60.0
	w.min_thickness = 4.0

	var band := w.get_band_at_x(0.0)
	assert_eq(band.center, 200.0)
	assert_eq(band.get_height(), 4.0)

func test_wave_reaches_full_shape_at_spawn_len():
	var w := Wave.new()
	w.base_y = 200.0
	w.spawn_y = 200.0
	w.spawn_blend_len = 80.0
	w.thickness = 60.0
	w.min_thickness = 4.0
	w.amplitude = 30.0

	var band := w.get_band_at_x(80.0)
	var real_y := w.base_y + w.amplitude * sin((80.0 * w.x_scale * w.frequency) + w.phase)

	assert_eq(band.center, real_y)
	assert_eq(band.get_height(), 60.0)
	
func test_wave_midpoint_is_between_min_and_full():
	var w := Wave.new()
	w.base_y = 200.0
	w.spawn_y = 200.0
	w.spawn_blend_len = 80.0
	w.thickness = 60.0
	w.min_thickness = 4.0

	var mid_band := w.get_band_at_x(40.0)
	assert_gt(mid_band.get_height(), 4.0)
	assert_lt(mid_band.get_height(), 60.0)
