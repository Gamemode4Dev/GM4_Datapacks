# run from gm4_potion_liquids:item_fill
# @s = tank being processed

scoreboard players set $item_value gm4_lt_value -1
loot replace block ~ ~ ~ container.0 loot gm4_potion_liquids:floating_potion
data modify storage gm4_liquid_tanks:temp/tank output set from block ~ ~ ~ Items[{Slot:0b}]
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
