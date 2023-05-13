# @s = endermen and shulkers near a teleporation jammer
# run from mob/check_pos

# get current y-coord
execute store result score current gm4_ta_pos_y run data get entity @s Pos[1] 100

# compare current y-coord to previous y-coord
scoreboard players operation difference gm4_ta_pos_y = current gm4_ta_pos_y
scoreboard players operation difference gm4_ta_pos_y -= @s gm4_ta_pos_y

# take absolute value of difference
scoreboard players set -1 gm4_ta_pos_y -1
execute if score difference gm4_ta_pos_y matches ..0 run scoreboard players operation difference gm4_ta_pos_y *= -1 gm4_ta_pos_y

# mark shulker if they moved too far
execute if entity @s[type=shulker] if score difference gm4_ta_pos_y matches 90.. run tag @s add gm4_ta_teleported
# mark endermen if they moved too far and is not falling
execute if entity @s[type=enderman] if score difference gm4_ta_pos_y matches 410.. run function gm4_teleportation_anchors:mob/track_movement/check_enderman_falling
