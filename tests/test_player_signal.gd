extends GutTest

func test_player_is_inside_band_when_y_between_top_and_bottom():
	var band := WaveBand.new(100.0, 120.0, 140.0)
	var player := PlayerSignal.new()
	player.y = 120.0

	assert_true(player.is_inside_band(band))

func test_player_is_outside_band_above():
	var band := WaveBand.new(100.0, 120.0, 140.0)
	var player := PlayerSignal.new()
	player.y = 80.0

	assert_false(player.is_inside_band(band))

func test_player_is_outside_band_below():
	var band := WaveBand.new(100.0, 120.0, 140.0)
	var player := PlayerSignal.new()
	player.y = 160.0

	assert_false(player.is_inside_band(band))

func test_player_moves_towards_target_y():
	var player := PlayerSignal.new()
	player.y = 100.0
	player.move_towards(130.0, 50.0, 1.0)

	assert_eq(player.y, 130.0)

func test_player_is_inside_band():
	var band := WaveBand.new(100.0, 120.0, 140.0)
	var player := PlayerSignal.new()
	player.y = 120.0   # 👈 lo pongo dentro
	assert_true(player.is_inside_band(band))

func test_player_can_check_against_wave_band():
	var wave := Wave.new()
	wave.base_y = 200
	wave.thickness = 60

	var band := wave.get_band_at_x(100.0)

	var player := PlayerSignal.new()
	player.y = band.center

	assert_true(player.is_inside_band(band))

func test_player_applies_input_up():
	var player := PlayerSignal.new()
	player.y = 200.0

	player.apply_input(-1.0, 100.0, 1.0) 

	assert_eq(player.y, 100.0)

func test_player_applies_input_down():
	var player := PlayerSignal.new()
	player.y = 200.0

	player.apply_input(1.0, 50.0, 1.0)

	assert_eq(player.y, 250.0)
