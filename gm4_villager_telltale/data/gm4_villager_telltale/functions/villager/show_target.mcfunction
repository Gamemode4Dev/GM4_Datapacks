
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_vt_target"]}
execute as @e[type=minecraft:area_effect_cloud,sort=nearest,limit=1,tag=gm4_vt_target] at @s run function gm4_villager_telltale:villager/as_target


