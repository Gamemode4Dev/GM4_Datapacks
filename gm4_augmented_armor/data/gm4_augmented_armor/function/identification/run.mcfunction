# prepare identifying item
# @s = unidentified item
# at @s
# run from check_item

# put data in storage
data modify storage gm4_augmented_armor:temp components set from entity @s Item.components
# get material and slot of this armor
execute store result score $material gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.material
execute store result score $set_slot gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.slot

# pick a random augment, unless one was already set
loot replace block 29999998 1 7134 container.0 loot gm4_augmented_armor:armor/identification/random
execute unless data storage gm4_augmented_armor:temp augment.pick run data modify storage gm4_augmented_armor:temp augment.pick set from block 29999998 1 7134 Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.set_augment

# get component data for this augment
function gm4_augmented_armor:identification/get_components with storage gm4_augmented_armor:temp augment
data modify storage gm4_augmented_armor:temp new_components set from block 29999998 1 7134 Items[{Slot:0b}].components

# merge components from item
data modify storage gm4_augmented_armor:temp new_components."minecraft:damage" merge from storage gm4_augmented_armor:temp components."minecraft:damage"
data modify storage gm4_augmented_armor:temp new_components."minecraft:attribute_modifiers".modifiers append from storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[]
data modify storage gm4_augmented_armor:temp new_components."minecraft:enchantments" merge from storage gm4_augmented_armor:temp components."minecraft:enchantments"

# get slot to use for attribute_modifiers
execute if score $set_slot gm4_aa_data matches 0 run function gm4_augmented_armor:identification/set_attribute/modifiers_head
execute if score $set_slot gm4_aa_data matches 1 run function gm4_augmented_armor:identification/set_attribute/modifiers_chest
execute if score $set_slot gm4_aa_data matches 2 run function gm4_augmented_armor:identification/set_attribute/modifiers_legs
execute if score $set_slot gm4_aa_data matches 3 run function gm4_augmented_armor:identification/set_attribute/modifiers_feet
# apply levels to custom attributes
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.armor_recharge run function gm4_augmented_armor:identification/set_attribute/armor_recharge
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed run function gm4_augmented_armor:identification/set_attribute/regen_speed

# merge components into item
data modify storage gm4_augmented_armor:temp components merge from storage gm4_augmented_armor:temp new_components

# mark as identified
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.identified set value 1

# remove durability damage taken
data modify storage gm4_augmented_armor:temp components."minecraft:damage" set value 0

# update item
data modify entity @s Item.components set from storage gm4_augmented_armor:temp components

# cleanup
data remove block 29999998 1 7134 Items
data remove storage gm4_augmented_armor:temp augment
data remove storage gm4_augmented_armor:temp new_components
