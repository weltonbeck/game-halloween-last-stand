@tool
extends Node2D

@export var max_drop_distance: float = 20.0
@export var health_component:HealthComponent
@export var target:Node2D

var items: Array[PackedScene] = []
var drop_chances: Array[int] = []

func _ready() -> void:
	if (health_component):
		health_component.die.connect(_on_die)
		
func get_random_pos_in_circle(radius : float) -> Vector2 :
	var x1 = randf_range(-1, 1)
	var x2 = randf_range(-1, 1)

	while x1*x1 + x2*x2 >= 1:
		x1 = randf_range(-1, 1)
		x2 = randf_range(-1, 1)

	var random_pos_on_unit_sphere = Vector2 (
		2 * x1 * sqrt (1 - x1*x1 - x2*x2),
		2 * x2 * sqrt (1 - x1*x1 - x2*x2))

	return random_pos_on_unit_sphere * randf_range(0, radius)

func _on_die() -> void:
	for i in items.size():
		var random_value = randf() * 100
		if (items[i] && drop_chances[i] && drop_chances[i] >= random_value):
			var instance_item = items[i].instantiate()
			if (target):
				instance_item.global_position = target.global_position
			else:
				instance_item.global_position = global_position
			instance_item.global_position += get_random_pos_in_circle(max_drop_distance)
			get_tree().root.call_deferred("add_child", instance_item)

func _get_property_list() -> Array[Dictionary]:
	var properties:Array[Dictionary] = []
	
	properties.append({
		"name": "item_count",
		"type": TYPE_INT,
		"usage": PROPERTY_USAGE_ARRAY | PROPERTY_USAGE_DEFAULT,
		"class_name": "items,item_",
		"hint": PROPERTY_HINT_NONE
	})
	
	for i in items.size():
		properties.append({
			"name": "item_%d/item" % i,
			"type": TYPE_OBJECT,
			"hint": PROPERTY_HINT_RESOURCE_TYPE,
			"hint_string": "PackedScene"
		})
		properties.append({
			"name": "item_%d/drop_chances" % i,
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,100,1"
		})
	
	return properties

func _get(property: StringName):
	if property == "item_count":
		return items.size()
	if property.begins_with("item_"):
		var parts = property.trim_prefix("item_").split("/")
		var i = parts[0].to_int()
		if parts[1] == "item":
			return items[i]
		else:
			return drop_chances[i]

func _set(property: StringName, value: Variant):
	if property == "item_count":
		items.resize(value)
		drop_chances.resize(value)
		for i in items.size():
			if ! items[i] is PackedScene:
				items[i] = null
			if ! drop_chances[i] is int:
				drop_chances[i] = 0
		notify_property_list_changed()
	elif property.begins_with("item_"):
		var parts = property.trim_prefix("item_").split("/")
		var i = parts[0].to_int()
		if parts[1] == "item":
			if value is PackedScene:
				items[i] = value
		else:
			if value is int:
				drop_chances[i] = value
