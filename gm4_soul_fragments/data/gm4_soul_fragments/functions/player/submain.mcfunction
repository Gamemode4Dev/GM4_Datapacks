# @s = player that has lost soul fragments
# at @s
# from main

# check for missing soul fragments and signs of life for regeneration managing
execute if score @s gm4_sf_fragments matches 1.. unless score @s gm4_sf_rspwn matches 1 run function gm4_soul_fragments:player/manage_regen

# tag soul fragments for sound/particles if holding a soul fire item
execute if predicate gm4_soul_fragments:reveal_item run scoreboard players set @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment,distance=..6] gm4_sf_fire 1

# check held soul in a lantern for release processing
execute if predicate gm4_soul_fragments:soul_in_a_lantern run function gm4_soul_fragments:player/items/check_held_id
execute unless predicate gm4_soul_fragments:soul_in_a_lantern/in_mainhand run scoreboard players reset @s gm4_sf_m_timer
execute unless predicate gm4_soul_fragments:soul_in_a_lantern/in_offhand run scoreboard players reset @s gm4_sf_o_timer
