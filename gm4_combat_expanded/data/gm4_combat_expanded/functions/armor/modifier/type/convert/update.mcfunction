# update convert armor
# @s = player wearing convert armor
# at @s
# run from advancement wear_convert

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# head
scoreboard players set $change gm4_ce_data 0
data modify storage gm4_combat_expanded:temp components set from storage gm4_combat_expanded:temp Items[{Slot:0b}].components
execute if data storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:item_modify_eval/head_update with storage gm4_combat_expanded:temp
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp components

# chest
scoreboard players set $change gm4_ce_data 0
data modify storage gm4_combat_expanded:temp components set from storage gm4_combat_expanded:temp Items[{Slot:1b}].components
execute if data storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:item_modify_eval/chest_update with storage gm4_combat_expanded:temp
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp components

# legs
scoreboard players set $change gm4_ce_data 0
data modify storage gm4_combat_expanded:temp components set from storage gm4_combat_expanded:temp Items[{Slot:2b}].components
execute if data storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:item_modify_eval/legs_update with storage gm4_combat_expanded:temp
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp components

# feet
scoreboard players set $change gm4_ce_data 0
data modify storage gm4_combat_expanded:temp components set from storage gm4_combat_expanded:temp Items[{Slot:3b}].components
execute if data storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:item_modify_eval/feet_update with storage gm4_combat_expanded:temp
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp components

# revoke advancement at the end to not trigger from changes made
advancement revoke @s only gm4_combat_expanded:wear_convert
