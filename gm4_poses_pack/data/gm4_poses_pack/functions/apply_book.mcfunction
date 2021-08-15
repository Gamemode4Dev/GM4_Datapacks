# @s = armor_stand to be modified
# at @s
# run from gm4_better_armour_stands/store_book_pages

# Grant advancement if any poses were changed.
execute if entity @s[tag=gm4_pose_changed] run function gm4_poses_pack:pose_changed
