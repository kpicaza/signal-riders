extends GutTest

func test_wave_view_builds_points_from_width():
	var wave := Wave.new()
	var view := WaveView.new()
	view.wave = wave

	var pts := view.get_points_for_width(800.0, 10.0)

	assert_eq(pts.size(), 81)
