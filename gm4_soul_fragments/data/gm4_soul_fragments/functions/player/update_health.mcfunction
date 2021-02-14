# @s = player who's just respawned or regained max health
# at respawn location
# from player/revived or player/regen_health

attribute @s[scores={gm4_sf_fragments=1}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -2 add
attribute @s[scores={gm4_sf_fragments=2}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -4 add
attribute @s[scores={gm4_sf_fragments=3}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -6 add
attribute @s[scores={gm4_sf_fragments=4}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -8 add
attribute @s[scores={gm4_sf_fragments=5}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -10 add
attribute @s[scores={gm4_sf_fragments=6}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -12 add
attribute @s[scores={gm4_sf_fragments=7}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -14 add
attribute @s[scores={gm4_sf_fragments=8}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -16 add
attribute @s[scores={gm4_sf_fragments=9}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -18 add

tag @s[nbt={ActiveEffects:[{Id:21b}]}] add gm4_sf_has_effect
effect give @s[tag=!gm4_sf_has_effect] health_boost 1 1
effect clear @s[tag=!gm4_sf_has_effect] health_boost
tag @s remove gm4_sf_has_effect

scoreboard players reset @s gm4_sf_timer
