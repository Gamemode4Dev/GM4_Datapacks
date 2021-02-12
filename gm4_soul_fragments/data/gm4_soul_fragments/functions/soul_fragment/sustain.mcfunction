# @s = abandoned soul fragment
# at @s
# from main

# target linked players for seeking
scoreboard players operation #current gm4_sf_id = @s gm4_sf_id
execute as @e[type=player,scores={gm4_sf_fragments=1..},distance=..16] if score @s gm4_sf_id = #current gm4_sf_id unless score @s gm4_sf_rspwn matches 1 run tag @s add gm4_sf_target
execute if entity @e[type=player,tag=gm4_sf_target,distance=..16] run function gm4_soul_fragments:soul_fragment/seek_player
execute as @e[type=player,tag=gm4_sf_target,distance=..16] if score @s gm4_sf_id = #current gm4_sf_id run tag @s remove gm4_sf_target

# age
scoreboard players add @s gm4_sf_age 1
execute if score @s gm4_sf_age matches 2250 at @s run function gm4_soul_fragments:soul_fragment/dissipate
