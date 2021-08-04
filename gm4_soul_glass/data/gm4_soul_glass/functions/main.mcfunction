# upgrade area effect clouds to markers
execute as @e[type=area_effect_cloud,tag=gm4_sg_furnace] at @s run function gm4_soul_glass:upgrade_marker_bf
execute as @e[type=area_effect_cloud,tag=gm4_soul_glass] at @s run function gm4_soul_glass:upgrade_marker_sg

# process soul glass and blast furnace
execute as @e[type=marker,tag=gm4_sg_furnace] at @s run function gm4_soul_glass:furnace/process
execute as @e[type=marker,tag=gm4_soul_glass] at @s run function gm4_soul_glass:process

schedule function gm4_soul_glass:main 16t
