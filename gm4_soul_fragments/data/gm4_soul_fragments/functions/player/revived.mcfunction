# @s = player who's just respawned
# at respawn location
# from main

# grant advancement when 1 max heart is left
advancement grant @s[scores={gm4_sf_fragments=9}] only gm4:soul_fragments

# put into "game over" if died after losing 9 hearts
execute if entity @s[scores={gm4_sf_fragments=10..}] run function gm4_soul_fragments:player/game_over

# apply correct max health
function gm4_soul_fragments:player/update_health

scoreboard players reset @s gm4_sf_died
scoreboard players reset @s gm4_sf_rspwn
