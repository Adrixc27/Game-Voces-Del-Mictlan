
extends CharacterBody3D
const VELOCIDAD = 4.0
const GRAVEDAD = 9.8
const SENSIBILIDAD = 0.005
@onready var camara = $Camera3D
var first_person = true
var inventario: Array = []
func _ready():
	activar_first_person()
func activar_first_person():
	camara.position = Vector3(0, 5, 0)
	camara.rotation_degrees.x = 0
	first_person = true
	
func activar_third_person():
	camara.position = Vector3(-1.37, 5.018, 0.708)
	camara.rotation_degrees.x = -23.5
	first_person = false
func _unhandled_input(event):
    #Boton para interactuar
	if event is InputEventKey and event.keycode == KEY_E and event.pressed:
		print("accion presionada")
		var puerta = get_node_or_null("../StaticBody3D2")
		print("Encontrado", puerta)
		if puerta and global_position.distance_to(puerta.global_position) > 2.0:
				if "llave" in inventario:
					puerta.abrir()
					inventario.erase("llave")
					print("Puerta abierta")
				else:
					print("Nesecitas una llave")
                    #Cambio de camara
	if event is InputEventKey:
		if event.keycode == KEY_C and event.pressed:
			if first_person:
				activar_third_person()
			else:
				activar_first_person()
	if event is InputEventMouseMotion:
		if first_person:
			var nueva_rotacion = rotation.y + (-event.relative.x * SENSIBILIDAD)
			rotation.y = clamp(nueva_rotacion, -PI/2, PI/2)
			camara.rotate_x(-event.relative.y * SENSIBILIDAD)
			camara.rotation.x = clamp(camara.rotation.x, -1.2, 1.2)
		else:
			var nueva_rotation = rotation.y + (-event.relative.x * SENSIBILIDAD)
			rotation.y = clamp(nueva_rotation, -PI/4, PI/4)
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= GRAVEDAD * delta
		#Movimiento del jugador 
	var direccion = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		direccion -= transform.basis.z
	if Input.is_action_pressed("ui_down"):
		direccion += transform.basis.z
	if Input.is_action_pressed("ui_left"):
		direccion -= transform.basis.x
	if Input.is_action_pressed("ui_right"):
		direccion += transform.basis.x
	direccion = direccion.normalized()
	velocity.x = direccion.x * VELOCIDAD
	velocity.z = direccion.z * VELOCIDAD
	move_and_slide()
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
        #Recoger objeto 
func recoger_objeto(nombre: String):
		inventario.append(nombre)
		print("recogiste: ", nombre)
		print("inventario: ", inventario)
        #Aparece el villano si recoges la llave
		if nombre == "llave":
			get_parent().get_node("Personaje Villano").visible = true
			get_parent().get_node("Personaje Villano").activo = false	