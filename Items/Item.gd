extends Resource

class_name Item

#Principal
export(String) var name = null
export(Texture) var texture
export(String) var description = null
export(String, "Other", "Equipament") var itemTypes
export(int, "None", "Helmet", "Armor", "Gauntlets", "Legs", "Boots", "Sword", "Shield") var equipmentTypes
var amount = 1

enum ItemTypes {EQUIPMENT, BOOK, POTION, CASH, OTHER}
export(ItemTypes) var itemType
enum EquipmentTypes {HELMET, ARMOR, GAUNTLETS, LEGS, BOOTS, SWORD, SHIELD, RING, OTHER}
export(EquipmentTypes) var equipmentType


#Damage & Armor

#Damage
export(int) var damage

enum DamageTypes {NONE, PIERCING, BLUNT, SLASH}
export(DamageTypes) var damageType
enum SecondDamageTypes {NONE, PIERCING, BLUNT, SLASH}
export(SecondDamageTypes) var secondDamageType
#Physical Damage Types:
#1 -> Piercing
#2 -> Blunt
#3 -> Slash

#Armor
export(int) var armor

#Heal & Cure
export(int) var healPoints
enum CureTypes {POISON, FLAMES, CORRUPTION}
