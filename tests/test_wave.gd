extends GutTest

func test_wave_returns_base_when_amp_zero():
	var wave = Wave.new()
	wave.base_y = 200
	wave.amp = 0
	var y = wave.get_y_at_x(100)
	assert_eq(y, 200)
