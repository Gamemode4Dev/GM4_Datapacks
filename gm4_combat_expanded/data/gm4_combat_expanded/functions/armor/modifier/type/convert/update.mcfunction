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
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:0b}].tag
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.head gm4_combat_expanded:update
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp tag

# chest
scoreboard players set $change gm4_ce_data 0
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:1b}].tag
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.chest gm4_combat_expanded:update
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp tag

# legs
scoreboard players set $change gm4_ce_data 0
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:2b}].tag
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.legs gm4_combat_expanded:update
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp tag

# feet
scoreboard players set $change gm4_ce_data 0
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:3b}].tag
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded{modifier:convert} run function gm4_combat_expanded:armor/modifier/type/convert/calc_conversion
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.feet gm4_combat_expanded:update
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
data remove storage gm4_combat_expanded:temp tag

# revoke advancement at the end to not trigger from changes made
advancement revoke @s only gm4_combat_expanded:wear_convert
