#@s = player that has lost soul fragments (@a[scores={gm4_sf_fragments=1..}] at @s)
#from main

#searches for fragments
tag @s add gm4_sf_target
scoreboard players operation #current gm4_sf_id = @s gm4_sf_id
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment,distance=..16] if score @s gm4_sf_id = #current gm4_sf_id at @s run function gm4_soul_fragments:soul_fragment/seek_player
tag @s remove gm4_sf_target

#manages regeneration
execute if score @s gm4_sf_fragments matches 1..4 run scoreboard players add @s gm4_sf_regen 1
execute if score @s gm4_sf_regen matches 6750 at @s run function gm4_soul_fragments:player/regen_health
