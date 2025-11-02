class_name GameSession
extends RefCounted

enum State { READY, PLAYING, GAME_OVER }

var state: State = State.READY
var signal_health: float = 1.0
var duration: float = 30.0
var elapsed: float = 0.0

func start() -> void:
	state = State.PLAYING
	elapsed = 0.0
	signal_health = 1.0

func update(delta: float) -> void:
	if state != State.PLAYING:
		return

	elapsed += delta
	if elapsed >= duration or signal_health <= 0.0:
		state = State.GAME_OVER

func apply_signal_damage(amount: float) -> void:
	signal_health = max(0.0, signal_health - amount)
	if signal_health <= 0.0:
		state = State.GAME_OVER
