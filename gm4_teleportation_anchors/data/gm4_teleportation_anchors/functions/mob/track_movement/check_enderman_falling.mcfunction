# @s = endermen  near a teleporation jammer
# run from mob/track_movement/check_dy

execute store result score fall gm4_ta_pos_y run data get entity @s FallDistance 100
execute if score fall gm4_ta_pos_y matches 0..90 run tag @s add gm4_ta_teleported
execute if score fall gm4_ta_pos_y matches 91.. run tag @s add gm4_ta_falling

execute if entity @s[type=enderman,tag=gm4_ta_teleported,nbt={ActiveEffects:[{Id:1b,Amplifier:0b}]}] if score difference gm4_ta_pos_x matches 410..510 run tag @s remove gm4_ta_teleported
execute if entity @s[type=enderman,tag=gm4_ta_teleported,nbt={ActiveEffects:[{Id:1b,Amplifier:1b}]}] if score difference gm4_ta_pos_x matches 410..690 run tag @s remove gm4_ta_teleported
