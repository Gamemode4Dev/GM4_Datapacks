#@s = liquid tanks
#run from main

#tank destruction
execute unless block ~ ~ ~ hopper run function liquid_tanks:destroy

#item processing
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,Count:1b}]} run function liquid_tanks:item_process

#last action resetting
execute unless block ~ ~ ~ hopper{Items:[{Slot:0b}]} run tag @s remove gm4_lt_drain
execute unless block ~ ~ ~ hopper{Items:[{Slot:0b}]} run tag @s remove gm4_lt_fill

#entity processing
execute align xyz positioned ~ ~1 ~ if entity @e[type=!armor_stand,dx=0] run function #liquid_tanks:util_above
execute align xyz positioned ~ ~-1 ~ if entity @e[type=!armor_stand,dx=0] run function #liquid_tanks:util_below

#display level update
execute unless score @s gm4_lt_buffer matches 0 run function liquid_tanks:liquid_value_update
