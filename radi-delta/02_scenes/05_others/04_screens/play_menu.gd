extends Node2D

@onready var timer: Timer = $Timer
@onready var label_timer: Label = $LabelTimer
@onready var total_time_seconds : int = 20
@onready var label_candy = $LabelNumCandy


func _ready():
	$Timer.start()

func addScore():
	#$LabelNumCandy.set_text(str(Global.caramelos))
	$LabelNumCandy.set_text(str("67"))
	################## Plare
	
func _on_timer_timeout() -> void:
	print(total_time_seconds)
	total_time_seconds +=1
	var m = int(total_time_seconds/60)
	var s = total_time_seconds - m *60
	Global.tiempo = total_time_seconds
	
	$LabelTimer.text = "%02d:%02d" % [m, s]
