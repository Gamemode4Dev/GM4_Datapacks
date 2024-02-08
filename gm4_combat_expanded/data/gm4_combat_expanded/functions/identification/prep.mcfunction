# prepare identifying item
# @s = unidentified item
# at @s
# run from check_item

# put data in storage
data modify storage gm4_combat_expanded:temp tag set from entity @s Item.tag

# check if item is armor or a weapon
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded.slot run function gm4_combat_expanded:identification/armor/pick_mod
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded.strike run function gm4_combat_expanded:identification/weapon/pick_mod

# update item
data modify entity @s Item.tag set from storage gm4_combat_expanded:temp tag

# cleanup
data remove block 29999998 1 7134 Items
