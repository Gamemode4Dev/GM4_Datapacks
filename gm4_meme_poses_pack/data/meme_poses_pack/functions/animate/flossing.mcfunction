# @s = armorstand that is flossing
# run from animate
execute if score @s gm4_meme_pose matches 3 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,5f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[308f,0f,341f],RightArm:[306f,0f,351f]}}
execute if score @s gm4_meme_pose matches 4 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[51f,0f,30f],RightArm:[46f,0f,32f]}}
execute if score @s gm4_meme_pose matches 5 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,5f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[308f,0f,341f],RightArm:[306f,0f,351f]}}
execute if score @s gm4_meme_pose matches 6 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[317f,0f,24f],RightArm:[317f,0f,15f]}}
execute if score @s gm4_meme_pose matches 7 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,5f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[36f,0f,347f],RightArm:[38f,0f,334f]}}
execute if score @s gm4_meme_pose matches 8 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[317f,0f,24f],RightArm:[317f,0f,15f]}}
scoreboard players set @s[scores={gm4_meme_pose=8}] gm4_meme_pose 2
