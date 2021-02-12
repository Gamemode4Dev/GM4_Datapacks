# @s = player who's just died
# at death location
# from main

execute if score @s gm4_sf_fragments matches 0..3 if entity @s[gamemode=!creative,gamemode=!spectator] run function gm4_soul_fragments:player/spawn_fragment

scoreboard players set @s gm4_sf_rspwn 1
scoreboard players reset @s gm4_sf_regen
scoreboard players reset @s gm4_sf_died
