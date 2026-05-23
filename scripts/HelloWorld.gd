extends Node3D

func _ready():
	var label = Label.new()
	var label2 = Label.new()

	label.text = "Hola Mundooooooooooo"
	label.position = Vector2(20, 20)
	add_child(label)

	label2.text = "Hola Muchacho esta es una prueba, plantilla oficial del juego :D"
	label2.position = Vector2(20, 60)
	add_child(label2)
