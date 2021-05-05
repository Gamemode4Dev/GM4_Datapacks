
# summon target
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_vt_target"]}
execute as @e[type=minecraft:area_effect_cloud,sort=nearest,limit=1,tag=gm4_vt_target] at @s run function gm4_villager_telltale:villager/as_target

# particles
execute at @s run particle happy_villager ~ ~.1 ~ .3 0 .3 .1 5
