# @s = jammed player who just ate chorus fruit
# run from player/used_chorus

tag @s add gm4_ta_teleported_player
tag @s add gm4_ta_store_pos
summon marker ~ ~ ~ {CustomName:'"gm4_ta_player_pos"',Tags:["gm4_ta_player_pos","gm4_ta_new_player_pos"]}

execute if entity @s[type=!player] store result score @s gm4_ta_id run data get entity @s UUID[3]

scoreboard players operation @e[type=marker,distance=..0.01,tag=gm4_ta_new_player_pos,limit=1] gm4_ta_jam_id = @s gm4_ta_jam_id
scoreboard players operation @e[type=marker,distance=..0.01,tag=gm4_ta_new_player_pos,limit=1] gm4_ta_id = @s gm4_ta_id

# if player was in an end gateway, move the marker to 1 block in pos x
execute if entity @s[tag=gm4_ta_gateway] run tp @e[type=marker,distance=..0.01,tag=gm4_ta_new_player_pos,limit=1] ^ ^ ^-1

# clean up
tag @s remove gm4_ta_gateway
tag @e[type=marker,tag=gm4_ta_player_pos,distance=..0.01] remove gm4_ta_new_player_pos

# start 20hz clock to check for movement
schedule function gm4_teleportation_anchors:player/temp_tick 1t
