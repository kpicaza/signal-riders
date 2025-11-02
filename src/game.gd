extends Node2D

@onready var player: Node2D = $Player
@onready var hud: CanvasLayer  = $Hud
@onready var wave: Node2D = %Wave

var session: GameSession

func _ready():
	session = GameSession.new()
	session.duration = 30.0

	wave.set_session(session)
	player.set_session(session)
	hud.set_session(session)

func _process(delta):
	session.update(delta)

	if session.state == GameSession.State.READY and Input.is_action_just_pressed("ui_accept"):
		player.reset_to_wave_center()
		session.start()

	if session.state == GameSession.State.GAME_OVER and Input.is_action_just_pressed("ui_accept"):
		player.reset_to_wave_center()
		session.start()
