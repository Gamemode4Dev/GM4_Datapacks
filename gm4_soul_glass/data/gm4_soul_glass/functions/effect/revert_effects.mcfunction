#@s = soul glass AEC
#run from effects/check

execute store result block ~ ~-1 ~ primary_effect int 1 run scoreboard players get @s gm4_sg_primary
execute store result block ~ ~-1 ~ secondary_effect int 1 run scoreboard players get @s gm4_sg_secondary

scoreboard players reset @s gm4_sg_primary
scoreboard players reset @s gm4_sg_secondary

playsound minecraft:block.beacon.power_select block @a[distance=..10]
particle minecraft:totem_of_undying ~ ~-1 ~ 0.5 0.5 0.5 .1 40 force
