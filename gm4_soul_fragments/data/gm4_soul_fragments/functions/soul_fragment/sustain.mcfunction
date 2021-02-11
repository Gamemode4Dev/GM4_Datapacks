#@s = abandoned soul fragment (@e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment] at @s)
#from main

#age
scoreboard players add @s gm4_sf_age 1
execute if score @s gm4_sf_age matches 2250 at @s run function gm4_soul_fragments:soul_fragment/dissipate
