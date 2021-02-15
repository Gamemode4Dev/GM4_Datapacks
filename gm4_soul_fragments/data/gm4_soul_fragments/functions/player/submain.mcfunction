# @s = player that has lost soul fragments
# at @s
# from main

# check for missing soul fragments and signs of life for regeneration managing
execute if score @s gm4_sf_fragments matches 1.. unless score @s gm4_sf_rspwn matches 1 run function gm4_soul_fragments:player/manage_regen

# tag soul fragments near players holding soul laterns for sound/particles
execute if predicate gm4_soul_fragments:reveal_item at @s run scoreboard players set @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment,distance=..6] gm4_sf_reveal 1
