extends GutTest

func test_session_starts_in_ready():
	var s := GameSession.new()
	assert_eq(s.state, GameSession.State.READY)

func test_session_moves_to_playing_on_start():
	var s := GameSession.new()
	s.start()
	assert_eq(s.state, GameSession.State.PLAYING)

func test_session_goes_game_over_when_signal_empty():
	var s := GameSession.new()
	s.start()
	s.signal_health = 0.0
	s.update(0.1)
	assert_eq(s.state, GameSession.State.GAME_OVER)

func test_session_ends_when_time_reaches_duration():
	var s := GameSession.new()
	s.duration = 5.0
	s.start()
	s.update(5.1)
	assert_eq(s.state, GameSession.State.GAME_OVER)
