#@s = none
#run from beacon_clock (on it's own clock)

execute as @e[type=area_effect_cloud,tag=gm4_soul_glass] at @s run function gm4_soul_glass:process

execute as @e[type=area_effect_cloud,tag=gm4_soul_glass] at @s if block ~ ~ ~ brown_stained_glass if predicate gm4_soul_glass:has_beam positioned ~-50 ~-51 ~-50 if entity @a[dx=100,dy=356,dz=100,limit=1] at @s run function gm4_soul_glass:effect/check

schedule function gm4_soul_glass:beacon_clock 80t
