#@s = player who's just died (@a[scores={gm4_sf_died=1..}] at @s)
#from main

execute if score @s gm4_sf_fragments matches 0..3 if entity @s[gamemode=!creative,gamemode=!spectator] run function gm4_soul_fragments:player/spawn_fragment

scoreboard players reset @s gm4_sf_regen
scoreboard players reset @s gm4_sf_died
