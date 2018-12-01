# @s = armorstand that is dabbing
# run from animate
execute if score @s gm4_meme_pose matches 0 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[25f,31f,0f],LeftLeg:[0f,0f,349f],RightLeg:[0f,0f,3f],LeftArm:[325f,0f,239f],RightArm:[272f,360f,0f]}}
execute if score @s gm4_meme_pose matches 1 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[34f,322f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,9f],LeftArm:[268f,348f,0f],RightArm:[196f,0f,281f]}}
scoreboard players set @s[scores={gm4_meme_pose=1}] gm4_meme_pose -1
