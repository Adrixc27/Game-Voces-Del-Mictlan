extends Node3D

func _ready():
	var label = Label.new()
	var label2 = Label.new()
	var label3 = Label.new()

	label.text = "Hola Mundooooooooooo"
	label.position = Vector2(20, 20)
	add_child(label)

	label2.text = "Hola Muchachos esta es una prueba, plantilla oficial del juego :D"
	label2.position = Vector2(20, 60)
	add_child(label2)

	label3.text = "uwu  plantilla oficial del juego :D"
	label3.position = Vector2(20, 100)
	add_child(label3)