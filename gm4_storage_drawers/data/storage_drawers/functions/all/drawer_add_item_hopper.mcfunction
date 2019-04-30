#run from detection_master_main in previous folder
#@s = as drawer at hopper not point down on sides

function storage_drawers:all/drawer_compare_hopper
execute if entity @s[tag=gm4_sd_compatable_hopper] store result score @s gm4_sd_hop_amnt run data get block ~ ~ ~ Items[0].Count 1
execute if entity @s[tag=gm4_sd_compatable_hopper] run scoreboard players remove @s gm4_sd_hop_amnt 1
execute if entity @s[tag=gm4_sd_compatable_hopper] store result block ~ ~ ~ Items[0].Count int 1 run scoreboard players get @s gm4_sd_hop_amnt 
execute if entity @s[tag=gm4_sd_compatable_hopper] run scoreboard players add @s gm4_sd_amount 1

tag @s remove gm4_sd_compatable_hopper