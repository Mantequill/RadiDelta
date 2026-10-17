extends Control

@warning_ignore("unused_signal")
signal finished(success)

@export var keyString: String = "Q"
@export var keyCode: Key = KEY_Q
@export var eventDuration := 0.5
@export var displayDuration := 0.5

@onready var color_rect: ColorRect =%ColorRect
@onready var key_label: Label = %KeyLabel
@onready var succes_label: Label = %SuccessLabel

var tween = create_tween()
var success = false

func _ready() -> void:
	add_to_group("QTE")
	key_label.text = keyString
	
	await _animation()
	
	if not success:
		hide()
		
func _animation():
	tween.tween_property(color_rect, "material:shader_parameter/value", 0, eventDuration)
	
	await tween.finished
	
@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(keyCode) and not succes_label.visible:
		succes_label.show()
		tween.kill()
		success = true
		
		await get_tree().create_timer(displayDuration).timeout
		
		hide()
