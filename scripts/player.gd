extends Node3D

const Velocidade := 0.4

@onready var Frente = $FrenteRay
@onready var Tras = $TrasRay

var tween
@onready var Camera = $Camera
func _physics_process(delta: float) -> void:
	if tween is Tween:
		if tween.is_running():
			return
	if Input.is_action_pressed("Frente") and not Frente.is_colliding():
		tween= create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"transform",transform.translated(-Camera.get_global_transform().basis.z*2),Velocidade)
	if Input.is_action_pressed("Tras") and not Tras.is_colliding():
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"transform",transform.translated(Camera.get_global_transform().basis.z*2),Velocidade)
	if Input.is_action_pressed("Direita"):
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"transform:basis", transform.basis.rotated(Camera.get_global_transform().basis.y, -PI/2),Velocidade)
	if Input.is_action_pressed("Esquerda"):
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"transform:basis", transform.basis.rotated(Camera.get_global_transform().basis.y, PI/2),Velocidade)
