# @s = armorstand with an animation
# run from main
execute if score @s gm4_meme_pose matches 0..1 run function meme_poses_pack:animate/dabbing
execute if score @s gm4_meme_pose matches 3..8 run function meme_poses_pack:animate/flossing
# increment the animation score by one
scoreboard players add @s gm4_meme_pose 1
