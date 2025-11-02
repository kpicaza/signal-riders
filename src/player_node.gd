extends Node2D

@onready var wave_node: Node2D = %Wave

@export var hit_x: float = 390.0
@export var follow_speed: float = 200.0
@export var move_speed: float = 200.0

var model: PlayerSignal
var inside := true
var signal_health := 1.0

func _ready() -> void:
	model = PlayerSignal.new()
	model.y = get_viewport_rect().size.y * 0.5


func _process(delta: float) -> void:
	var dir := 0.0
	if Input.is_action_pressed("ui_up"):
		dir -= 1.0
	if Input.is_action_pressed("ui_down"):
		dir += 1.0
	model.apply_input(dir, move_speed, delta)

	var band : WaveBand = wave_node.wave.get_band_at_x(hit_x)
	inside = model.is_inside_band(band)

	var collided := model.clamp_to_band(band)
	if collided:
		signal_health -= 0.2 * delta

	position.x = hit_x
	position.y = model.y
	queue_redraw()

func _draw() -> void:
	var color := Color.WHITE if inside else Color(1, 0.2, 0.2)
	draw_circle(Vector2.ZERO, 10.0, color)
