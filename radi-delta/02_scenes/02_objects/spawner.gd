extends Node2D

const SCREEN_WIDTH = 1920
const SCREEN_HEIGHT = 1080
const SPAWN_WIDTH = SCREEN_WIDTH - 200
const SPAWN_HEIGHT = 456
const SPAWN_ADD = 237

@onready var static_main_road_holder = $"../../staticMainRoadHolder"
@onready var static_holder = $"../../staticMainRoadHolder" #cuidado con crossroads
var SPAWN_MID = Vector2(0,0)
var ROAD_ARRAY = []
var car = preload("res://02_scenes/02_objects/coche.tscn") 
var bus = preload("res://02_scenes/02_objects/bus.tscn")
var crossroad = preload("res://02_scenes/02_objects/crossroads.tscn")
var collectible = preload("res://02_scenes/02_objects/collectible.tscn")
var main_road = preload("res://02_scenes/02_objects/main_road.tscn")
var player = preload("res://02_scenes/01_characters/player.tscn")
var is_crossroad_onscreen = false
var last_spawned_road_pos = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$marker01.position.x = SPAWN_WIDTH + 500
	$marker02.position.x = SPAWN_WIDTH + 500
	$marker03.position.x = SPAWN_WIDTH + 500
	
	$marker01.position.y = SPAWN_HEIGHT
	$marker02.position.y = SPAWN_HEIGHT + SPAWN_ADD
	$marker03.position.y = SPAWN_HEIGHT + (SPAWN_ADD*2)
	ROAD_ARRAY = [$marker01.position, $marker02.position, $marker03.position]
	SPAWN_MID = $marker02.position
	pass # Replace with function body.
	

func _on_spawn_timer_cars():
	#if $misPasosDeCebra.get_child_count() <= 0: !!!!!!!AAAAAAAA!!!!!
		#var stage_node = get_parent() #no necesario
		var car_instance = car.instantiate()
		car_instance.position = ROAD_ARRAY.pick_random()
		car_instance.position.x = self.get_parent().position.x + SCREEN_WIDTH  + 500
		static_holder.add_child(car_instance)

func _on_spawn_timer_buses():
	#var stage_node = get_parent() #no necesario
	var bus_instance = bus.instantiate()
	var picklane = ROAD_ARRAY.pick_random()
	bus_instance.position = picklane
	bus_instance.position.x = self.get_parent().position.x + SCREEN_WIDTH  + 1500
	static_holder.add_child(bus_instance)
	$BusPasando.play()
	$WarningBus2.position = picklane
	$WarningBus.play("WarningBus")
	

func _on_spawn_timer_crossroads():
	#var stage_node = get_parent() #no necesario
	var crossroad_instance = crossroad.instantiate()
	crossroad_instance.position = SPAWN_MID
	crossroad_instance.position.x = self.get_parent().position.x + SCREEN_WIDTH + 500
	#stage_node.add_child(crossroad_instance)
	#$misPasosDeCebra.add_child(crossroad_instance) !!!!!!AAAAAAAAA""""""""""""
	static_holder.add_child(crossroad_instance)
	is_crossroad_onscreen = true

func _on_spawn_timer_collectible():
	#var stage_node = get_parent() #no necesario
	var collectible_instance = collectible.instantiate()
	collectible_instance.position = ROAD_ARRAY.pick_random()
	collectible_instance.position.x = self.get_parent().position.x + SCREEN_WIDTH + 500
	static_holder.add_child(collectible_instance)

func _on_spawn_timer_main_road_timeout() -> void:
	pass
	#spawn_bg()


func spawn_bg():
	var main_road_instance = main_road.instantiate()
	main_road_instance.position.y = floor(SCREEN_HEIGHT)/2 # floor() es para que no dé warning por dividir un int
	main_road_instance.position.x = self.get_parent().position.x+2880
	#stage_node.add_child(crossroad_instance)
	#$misPasosDeCebra.add_child(crossroad_instance) !!!!!!AAAAAAAAA""""""""""""
	static_main_road_holder.add_child(main_road_instance)
	return main_road_instance.position.x


func _process(delta: float) -> void:
	if int(self.global_position.x) > last_spawned_road_pos-960:
		last_spawned_road_pos = spawn_bg()
	



func _on_killzone_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
