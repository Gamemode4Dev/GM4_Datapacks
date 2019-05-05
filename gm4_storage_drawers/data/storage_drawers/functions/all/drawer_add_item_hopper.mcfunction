#run from drawer_compare_hopper
#@s = as drawer at hopper not point down on sides

execute store result score @s gm4_sd_hop_amnt run data get block ~ ~ ~ Items[0].Count 1
scoreboard players remove @s gm4_sd_hop_amnt 1
execute store result block ~ ~ ~ Items[0].Count int 1 run scoreboard players get @s gm4_sd_hop_amnt 
scoreboard players add @s gm4_sd_amount 1

tag @s remove gm4_sd_compatible_hopper