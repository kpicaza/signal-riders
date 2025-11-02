extends GutTest

func test_wave_band_has_top_center_and_bottom():
	var band := WaveBand.new(100.0, 120.0, 140.0)
	assert_eq(band.top, 100.0)
	assert_eq(band.center, 120.0)
	assert_eq(band.bottom, 140.0)

func test_wave_band_height_is_bottom_minus_top():
	var band := WaveBand.new(100.0, 120.0, 140.0)
	assert_eq(band.get_height(), 40.0)
