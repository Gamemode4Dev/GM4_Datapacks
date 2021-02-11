#@s = player who's lost soul fragments who hasn't picked them up in a really long time (@a[scores={gm4_sf_fragments=1..}] at @s)
#from player/search_fragment

attribute @s minecraft:generic.max_health modifier remove c93b8492-66c8-40bf-ad0e-cd8405099aa8
scoreboard players remove @s gm4_sf_fragments 1
attribute @s[scores={gm4_sf_fragments=1}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -4 add
attribute @s[scores={gm4_sf_fragments=2}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -8 add
attribute @s[scores={gm4_sf_fragments=3}] minecraft:generic.max_health modifier add c93b8492-66c8-40bf-ad0e-cd8405099aa8 gm4_st_health_boost -12 add

tag @s[nbt={ActiveEffects:[{Id:21b}]}] add gm4_sf_has_effect
effect give @s[tag=!gm4_sf_has_effect] health_boost 1 1
effect clear @s[tag=!gm4_sf_has_effect] health_boost
tag @s remove gm4_sf_has_effect

playsound minecraft:block.bell.resonate master @a[distance=..5] ~ ~ ~ .4 2
execute at @s run particle minecraft:soul ~ ~1.2 ~ .22 0 .22 .025 7 force

scoreboard players reset @s gm4_sf_regen
