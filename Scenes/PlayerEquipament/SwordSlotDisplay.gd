extends CenterContainer

var inventory = preload("res://PlayerEquipament.tres")

onready var t = Timer.new()
onready var itemTextureRect = $ItemTextureRect
onready var itemAmountLabel = $ItemTextureRect/ItemAmountLabel

var mouseAtSlot = false

func display_item(item):
	if item is Item && item.itemType == "Equipament":
		itemTextureRect.texture = item.texture
		itemAmountLabel.text = str(item.amount)
	else:
		itemTextureRect.texture = load("res://Assets/SwordSlot.png")
		itemAmountLabel.text = ""


func get_drag_data(_position):
	var item_index = get_index()
	var item = inventory.remove_item(item_index)
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var dragPreview = TextureRect.new()
		dragPreview.texture = item.texture
		set_drag_preview(dragPreview)
		inventory.drag_data = data
		return data


func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")

func drop_data(_position,data):
	var my_item_index = get_index()
	var my_item = inventory.items[my_item_index]
	
	if my_item is Item and my_item.name == data.item.name:
		my_item.amount += data.item.amount
		inventory.emit_signal("items_changed", [my_item_index])
	else:
		inventory.swap_items(my_item_index, data.item_index)
		inventory.set_item(my_item_index, data.item)
	
	inventory.drag_data = null


func _on_ItemTextureRect_mouse_entered():
	mouseAtSlot = true
	if mouseAtSlot:
		var item_index = get_index()
		var item = inventory.items[item_index]
		
		t.set_wait_time(3)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		
		if item is Item:
			print(item.description)
		else:
			print("There's not a item in the slot")


func _on_ItemTextureRect_mouse_exited():
	mouseAtSlot = false
	t.stop()
	t.set_wait_time(0)
