
tag @s add gm4_vt_looking
data modify entity @s NoAI set value 1b
execute as @s facing entity @e[type=minecraft:area_effect_cloud,sort=nearest,limit=1,tag=gm4_vt_target] feet run tp @s ~ ~ ~ ~ ~
