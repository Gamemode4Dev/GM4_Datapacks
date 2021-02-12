# @s = abandoned soul fragment
# at @s
# from main

#set scoreboard ID
scoreboard players operation #current gm4_sf_id = @s gm4_sf_id

# die if nearby linked player is at full hearts
execute if score @p[gamemode=!creative,gamemode=!spectator,distance=..22,scores={gm4_sf_fragments=0}] gm4_sf_id = #current gm4_sf_id run stopsound @a[distance=..22] neutral minecraft:block.beacon.ambient
execute if score @p[gamemode=!creative,gamemode=!spectator,distance=..22,scores={gm4_sf_fragments=0}] gm4_sf_id = #current gm4_sf_id run kill @s

# target linked players for seeking 
execute as @e[gamemode=!creative,gamemode=!spectator,type=player,scores={gm4_sf_fragments=1..},distance=..16] if score @s gm4_sf_id = #current gm4_sf_id unless score @s gm4_sf_rspwn matches 1 run tag @s add gm4_sf_target
execute if entity @e[type=player,tag=gm4_sf_target,distance=..16] run function gm4_soul_fragments:soul_fragment/seek_player
execute as @e[type=player,tag=gm4_sf_target,distance=..16] if score @s gm4_sf_id = #current gm4_sf_id run tag @s remove gm4_sf_target

# manage age
scoreboard players add @s gm4_sf_age 1
execute if score @s gm4_sf_age matches 2250 at @s run function gm4_soul_fragments:soul_fragment/dissipate

