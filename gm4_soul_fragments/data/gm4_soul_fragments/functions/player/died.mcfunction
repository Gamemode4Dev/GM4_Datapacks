# @s = player who's just died from damage
# at death location
# from player/check_death

tag @s remove gm4_sf_target

scoreboard players add @s gm4_sf_fragments 1
execute if score @s gm4_sf_fragments matches 0..8 run function gm4_soul_fragments:player/spawn_fragment

scoreboard players set @s gm4_sf_rspwn 1
scoreboard players reset @s gm4_sf_regen
scoreboard players reset @s gm4_sf_died
