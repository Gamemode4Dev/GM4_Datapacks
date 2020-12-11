# @s = jammed player who just ate chorus fruit
# run from player/used_chorus

tag @s add gm4_ta_teleported
tag @s add gm4_ta_store_pos
summon area_effect_cloud ~ ~ ~ {CustomName:'"gm4_ta_player_pos"',Tags:["gm4_ta_player_pos","gm4_ta_new_player_pos"],Radius:0f,Duration:2147483647,Particle:"block air"}
scoreboard players operation @e[type=area_effect_cloud,distance=..0.01,tag=gm4_ta_new_player_pos,limit=1] gm4_ta_jam_id = @s gm4_ta_jam_id
scoreboard players operation @e[type=area_effect_cloud,distance=..0.01,tag=gm4_ta_new_player_pos,limit=1] gm4_ta_id = @s gm4_ta_id

# if player was in an end gateway, move the AEC to 1 block in pos x
execute if entity @s[tag=gm4_ta_gateway] run tp @e[type=area_effect_cloud,distance=..0.01,tag=gm4_ta_new_player_pos,limit=1] ^ ^ ^-1

# clean up
tag @s remove gm4_ta_gateway
tag @e[type=area_effect_cloud,tag=gm4_ta_player_pos,distance=..0.01] remove gm4_ta_new_player_pos

# start 20hz clock to check for movement
schedule function gm4_teleportation_anchors:player/temp_tick 1t
