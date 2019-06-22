#@s = liquid tank with item in first slot
#run from liquid_tanks:process

#tank init
execute if score @s[tag=gm4_lt_empty] gm4_lt_value matches 0 run function #liquid_tanks:tank_init

#item drain
function #liquid_tanks:item_drain

#item_fill
#make sure we don't undo our action
execute store success score @s gm4_lt_util run data modify entity @s ArmorItems[3].tag.gm4_lt.last_item set from block ~ ~ ~ Items
execute if score @s gm4_lt_util matches 0 run function #liquid_tanks:item_fill
#store change
execute if score @s gm4_lt_util matches 0 run data modify entity @s ArmorItems[3].tag.gm4_lt.last_item set from block ~ ~ ~ Items
