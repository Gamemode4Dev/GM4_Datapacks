# @s = player that has lost soul fragments
# at @s
# from main

# manage regeneration
execute if score @s gm4_sf_fragments matches 1..4 run scoreboard players add @s gm4_sf_regen 1
execute if score @s gm4_sf_regen matches 6750 at @s run function gm4_soul_fragments:player/regen_health
