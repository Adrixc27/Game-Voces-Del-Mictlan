
extends node3D
var cameraIntro = $CameraIntro
var jugador = $CharacterBody3D
var anim_Intro = $AnimationPlayer
func _ready():
    jugador.set_process(false) 
    jugador.set_physics_process(false)
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
    cameraIntro.current = true
    anim_Intro.play("Intro")
    anim_Intro.animation_finished.connect(_on_animation_finished)
func _on_animation_finished(anim_name):
    if anim_name == "Intro":
        cameraIntro.current = false
        jugador.set_process(true) 
        jugador.set_physics_process(true)
        Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
        
