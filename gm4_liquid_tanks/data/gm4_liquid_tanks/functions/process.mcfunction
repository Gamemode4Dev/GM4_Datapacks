#@s = liquid tanks
#run from main

#tank destruction
execute unless block ~ ~ ~ hopper run function gm4_liquid_tanks:destroy

#item processing
data modify storage gm4_liquid_tanks:temp/tank input_slot merge from block ~ ~ ~ Items[{Slot:0b}]
execute store result score $stack_size gm4_lt_value run data get storage gm4_liquid_tanks:temp/tank input_slot.Count 1.0
function gm4_liquid_tanks:item_process
data remove storage gm4_liquid_tanks:temp/tank input_slot
data remove storage gm4_liquid_tanks:temp/tank output

#last item action resetting
execute unless block ~ ~ ~ hopper{Items:[{Slot:0b}]} run tag @s remove gm4_lt_drain
execute unless block ~ ~ ~ hopper{Items:[{Slot:0b}]} run tag @s remove gm4_lt_fill

#entity processing
execute if block ~ ~ ~ hopper[enabled=true] align xyz positioned ~ ~1 ~ if entity @e[type=!armor_stand,dx=0] run function #gm4_liquid_tanks:util_above
execute if block ~ ~ ~ hopper[enabled=true] align xyz positioned ~ ~-1 ~ if entity @e[type=!armor_stand,dx=0] run function #gm4_liquid_tanks:util_below

#display level update
execute unless score @s gm4_lt_prior_val = @s gm4_lt_value run function gm4_liquid_tanks:liquid_value_update
