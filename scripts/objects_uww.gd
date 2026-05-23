
extends Area3D
@export var nombre_objeto: String = "llave"
func _ready():
	body_entered.connect(_on_body_entered)
func _on_body_entered(body):
	if body is CharacterBody3D:
		# Avisar al jugador que recogió el objeto
		body.recoger_objeto(nombre_objeto)
		# Eliminar el objeto de la escena
		queue_free()