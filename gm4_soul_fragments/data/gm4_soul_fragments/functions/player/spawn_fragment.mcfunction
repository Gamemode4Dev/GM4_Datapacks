# @s = player who's died
# at @s
# from player/died

scoreboard players add @s gm4_sf_fragments 1

particle minecraft:soul ~ ~1.2 ~ .17 0 .17 .03 3 normal
playsound minecraft:block.chorus_flower.death player @a[distance=..5] ~ ~ ~ .9 2

summon area_effect_cloud ~ ~ ~ {Radius:0,Age:-2147483648,CustomName:'"gm4_soul_fragment"',Tags:["gm4_soul_fragment","gm4_new_soul_fragment"],Particle:"block air"}
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_new_soul_fragment,distance=..1,limit=1] gm4_sf_id = @s gm4_sf_id
tag @e[type=area_effect_cloud,tag=gm4_soul_fragment] remove gm4_new_soul_fragment
