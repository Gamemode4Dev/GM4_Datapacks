# @s = endermen and shulkers near a teleporation jammer
# run from mob/check_pos

# get current x-coord
execute store result score current gm4_ta_pos_x run data get entity @s Pos[0] 100

# compare current x-coord to previous x-coord
scoreboard players operation difference gm4_ta_pos_x = current gm4_ta_pos_x
scoreboard players operation difference gm4_ta_pos_x -= @s gm4_ta_pos_x

# take absolute value of difference
scoreboard players set -1 gm4_ta_pos_x -1
execute if score difference gm4_ta_pos_x matches ..0 run scoreboard players operation difference gm4_ta_pos_x *= -1 gm4_ta_pos_x

# mark entity as teleported if they moved too far
execute if entity @s[type=enderman] if score difference gm4_ta_pos_x matches 360.. run tag @s add gm4_ta_teleported
execute if score difference gm4_ta_pos_x matches 360..510 run tag @s[type=enderman,nbt={ActiveEffects:[{Id:1b,Amplifier:0b}]}] remove gm4_ta_teleported
execute if score difference gm4_ta_pos_x matches 360..690 run tag @s[type=enderman,nbt={ActiveEffects:[{Id:1b,Amplifier:1b}]}] remove gm4_ta_teleported

execute if entity @s[type=shulker] if score difference gm4_ta_pos_x matches 90.. run tag @s add gm4_ta_teleported
