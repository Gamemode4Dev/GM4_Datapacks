# dabbing
execute if score @s gm4_meme_pose matches 0 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[25f,31f,0f],LeftLeg:[0f,0f,349f],RightLeg:[0f,0f,3f],LeftArm:[325f,0f,239f],RightArm:[272f,360f,0f]}}
execute if score @s gm4_meme_pose matches 1 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[34f,322f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,9f],LeftArm:[268f,348f,0f],RightArm:[196f,0f,281f]}}

# flossing
execute if score @s gm4_meme_pose matches 3 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,5f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[308f,0f,341f],RightArm:[306f,0f,351f]}}
execute if score @s gm4_meme_pose matches 4 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[51f,0f,30f],RightArm:[46f,0f,32f]}}
execute if score @s gm4_meme_pose matches 5 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,5f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[308f,0f,341f],RightArm:[306f,0f,351f]}}
execute if score @s gm4_meme_pose matches 6 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[317f,0f,24f],RightArm:[317f,0f,15f]}}
execute if score @s gm4_meme_pose matches 7 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,5f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[36f,0f,347f],RightArm:[38f,0f,334f]}}
execute if score @s gm4_meme_pose matches 8 run data merge entity @s {ShowArms:1b,Pose:{Body:[0f,3f,355f],Head:[0f,0f,0f],LeftLeg:[0f,0f,355f],RightLeg:[0f,0f,7f],LeftArm:[317f,0f,24f],RightArm:[317f,0f,15f]}}

# timer
scoreboard players add @s gm4_meme_pose 1
scoreboard players set @s[scores={gm4_meme_pose=2}] gm4_meme_pose 0
scoreboard players set @s[scores={gm4_meme_pose=9}] gm4_meme_pose 3
