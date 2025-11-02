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
