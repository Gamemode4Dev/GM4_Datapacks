# clock totem processing
# @s = unspecified
# at unspecified
# scheduled from armor/modifier/type/totem/activate
# scheduled from here

execute as @e[type=armor_stand,tag=gm4_ce_totem] at @s run function gm4_combat_expanded:armor/modifier/type/totem/process

execute if entity @e[type=armor_stand,tag=gm4_ce_totem,limit=1] run schedule function gm4_combat_expanded:clocks/temp/totem 5s
