
execute as @e[type=armor_stand,tag=gm4_ce_totem] at @s run function gm4_combat_expanded:armor/modifier/type/totem/process

execute if entity @e[type=armor_stand,tag=gm4_ce_totem,limit=1] run schedule function gm4_combat_expanded:armor/modifier/type/totem/clock 5s
