# @s = player who's just died from damage
# at death location
# from player/damage_check

tag @s remove gm4_sf_target

# add 1 to missing soul fragment count
execute if score @s gm4_sf_fragments matches 0..9 run scoreboard players add @s gm4_sf_fragments 1
function gm4_soul_fragments:spawn_fragment

scoreboard players set @s gm4_sf_rspwn 1
scoreboard players reset @s gm4_sf_timer
scoreboard players reset @s gm4_sf_died
