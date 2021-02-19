# @s = mob holding a soul in a lantern
# at location
# run from main

scoreboard players add @s gm4_sf_timer 1
execute if score @s gm4_sf_timer matches 6 at @s run function gm4_soul_fragments:mob/release_angry_soul
