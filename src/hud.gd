extends CanvasLayer

@onready var label: Label = $Label

var session: GameSession

func set_session(game_session: GameSession) -> void:
	session = game_session

func _process(_delta):
	if session == null:
		return

	var text := ""
	match session.state:
		GameSession.State.READY:
			text = "PRESS SPACE TO START"
		GameSession.State.PLAYING:
			text = "SIGNAL: " + str(round(session.signal_health  * 100)) + "%"
		GameSession.State.GAME_OVER:
			text = "SIGNAL LOST - PRESS SPACE"
	label.text = text
