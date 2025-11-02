extends Node2D

@onready var wave_node: Node2D = %Wave

@export var hit_x: float = 600.0
@export var move_speed: float = 200.0

var session: GameSession = null
var model: PlayerSignal
var inside: bool = true
var signal_health: float = 1.0

func set_session(game_session: GameSession) -> void:
	session = game_session

func _ready() -> void:
	model = PlayerSignal.new()
	model.y = get_viewport_rect().size.y * 0.5
	reset_to_wave_center()

func _process(delta: float) -> void:
	var can_play := true
	if session != null and session.state != GameSession.State.PLAYING:
		can_play = false

	if can_play:
		var dir := 0.0
		if Input.is_action_pressed("ui_up"):
			dir -= 1.0
		if Input.is_action_pressed("ui_down"):
			dir += 1.0
		model.apply_input(dir, move_speed, delta)

	var band: WaveBand = wave_node.wave.get_band_at_x(hit_x)
	inside = model.is_inside_band(band)

	var collided := model.clamp_to_band(band)

	if collided:
		if session != null:
			session.apply_signal_damage(0.2 * delta)
		else:
			signal_health -= 0.2 * delta

	position.x = hit_x
	position.y = model.y
	queue_redraw()

func reset_to_wave_center() -> void:
	var band: WaveBand = wave_node.wave.get_band_at_x(hit_x)
	model.y = band.center
	position.x = hit_x
	position.y = model.y

func _draw() -> void:
	var color := Color.WHITE if inside else Color(1, 0.2, 0.2)
	draw_circle(Vector2.ZERO, 10.0, color)
