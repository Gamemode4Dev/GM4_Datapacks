# updates every second
# run from gm4_garden_variety:init


schedule function gm4_garden_variety:clock/1s 1s

# arborist analyzer
execute as @e[type=armor_stand,tag=gm4_gv_analyzer,sort=random] at @s run function gm4_garden_variety:mechanics/analyzer/process
