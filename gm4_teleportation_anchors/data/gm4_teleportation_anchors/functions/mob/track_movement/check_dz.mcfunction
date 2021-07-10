# @s = endermen and shulkers near a teleporation jammer
# run from mob/check_pos

# get current z-coord
execute store result score current gm4_ta_pos_z run data get entity @s Pos[2] 100

# compare current z-coord to previous z-coord
scoreboard players operation difference gm4_ta_pos_z = current gm4_ta_pos_z
scoreboard players operation difference gm4_ta_pos_z -= @s gm4_ta_pos_z

# take absolute value of difference
scoreboard players set -1 gm4_ta_pos_z -1
execute if score difference gm4_ta_pos_z matches ..0 run scoreboard players operation difference gm4_ta_pos_z *= -1 gm4_ta_pos_z

# mark entity as teleported if they moved too far
execute if entity @s[type=enderman] if score difference gm4_ta_pos_z matches 360.. run tag @s add gm4_ta_teleported
execute if score difference gm4_ta_pos_z matches 360..510 run tag @s[type=enderman,nbt={ActiveEffects:[{Id:1b,Amplifier:0b}]}] remove gm4_ta_teleported
execute if score difference gm4_ta_pos_z matches 360..690 run tag @s[type=enderman,nbt={ActiveEffects:[{Id:1b,Amplifier:1b}]}] remove gm4_ta_teleported

execute if entity @s[type=shulker] if score difference gm4_ta_pos_z matches 90.. run tag @s add gm4_ta_teleported
