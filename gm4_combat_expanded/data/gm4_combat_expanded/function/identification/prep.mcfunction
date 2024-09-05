# prepare identifying item
# @s = unidentified item
# at @s
# run from check_item

# put data in storage
data modify storage gm4_combat_expanded:temp components set from entity @s Item.components

# check if item is armor or a weapon
execute if data storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.slot run function gm4_combat_expanded:identification/armor/pick_mod
execute if data storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.strike run function gm4_combat_expanded:identification/weapon/pick_mod

# mark as identified
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.identified set value 1

# remove durability damage taken
data modify storage gm4_combat_expanded:temp components."minecraft:damage" set value 0

# update item
data modify entity @s Item.components set from storage gm4_combat_expanded:temp components

# cleanup
data remove block 29999998 1 7134 Items
