#@s = liquid tanks
#run from main

#tank destruction
execute unless block ~ ~ ~ hopper run function liquid_tanks:destroy

#entity processing
execute align xyz positioned ~ ~1 ~ if entity @e[type=!armor_stand,dx=0] run function #liquid_tanks:util_above
execute align xyz positioned ~ ~-1 ~ if entity @e[type=!armor_stand,dx=0] run function #liquid_tanks:util_below

#last action resetting iff value changed
execute unless score @s gm4_lt_old_value = @s gm4_lt_value run data remove entity @s ArmorItems[3].tag.gm4_lt.last_item

#item processing
execute store success score @s gm4_lt_util run data modify entity @s ArmorItems[3].tag.gm4_lt.last_item set from block ~ ~ ~ Items
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,Count:1b}]} if score @s gm4_lt_util matches 1.. run function liquid_tanks:item_process

# if value changed update display level
execute unless score @s gm4_lt_old_value = @s gm4_lt_value run function liquid_tanks:liquid_value_update
