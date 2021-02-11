#@s = player who's just respawned (@e[type=player,scores={gm4_sf_rspwn=1..}] at @s)
#from main

attribute @s[scores={gm4_sf_fragments=1}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -4 add
attribute @s[scores={gm4_sf_fragments=2}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -8 add
attribute @s[scores={gm4_sf_fragments=3}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -12 add
attribute @s[scores={gm4_sf_fragments=4}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -16 add

tag @s[nbt={ActiveEffects:[{Id:21b}]}] add gm4_sf_has_effect
effect give @s[tag=!gm4_sf_has_effect] health_boost 1 1
effect clear @s[tag=!gm4_sf_has_effect] health_boost
tag @s remove gm4_sf_has_effect

advancement grant @s[scores={gm4_sf_fragments=4}] only gm4:soul_fragments

scoreboard players reset @s gm4_sf_regen
scoreboard players reset @s gm4_sf_rspwn
