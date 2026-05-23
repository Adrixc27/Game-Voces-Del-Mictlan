
extends Node3D
var activo = false
var VELOCIDAD = 2.0
@onready var jugador = get_parent().get_node("CharacterBody3D")
func _ready():
	visible = false
func _physics_process(delta):
	if not activo:
		return
	look_at(jugador.global_position, Vector3.UP)
	var direccion = (jugador.global_position - global_position).normalized()
	global_position += direccion * VELOCIDAD * delta