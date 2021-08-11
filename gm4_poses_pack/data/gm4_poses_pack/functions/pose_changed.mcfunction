# @s = modified armor_stand
# at @s
# run from apply_pose

advancement grant @a[gamemode=!spectator,distance=..4] only gm4:poses_pack
playsound minecraft:block.wooden_button.click_on player @a[distance=..5]
tag @s remove gm4_pose_changed
