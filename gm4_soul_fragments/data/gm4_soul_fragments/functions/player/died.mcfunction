# @s = player who's just died from damage
# at death location
# from player/damage_check

# add 1 to missing soul fragment count
execute if score @s gm4_sf_fragments matches 0..9 run scoreboard players add @s gm4_sf_fragments 1
function gm4_soul_fragments:player/spawn_fragment
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_new_soul_fragment,limit=1,sort=nearest,distance=...3] gm4_sf_id = @s gm4_sf_id
tag @e[type=area_effect_cloud,tag=gm4_new_soul_fragment] remove gm4_new_soul_fragment

scoreboard players set @s gm4_sf_rspwn 1
scoreboard players reset @s gm4_sf_died
