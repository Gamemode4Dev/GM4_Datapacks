# @s = armor_stand to be modified
# at @s
# run from apply_pose

# If a additional code is given
execute if data storage gm4_better_armour_stands:temp {pages:["vertical"]} run function gm4_poses_pack:move_calc

# Otherwise, teleport armor_stand to player
execute unless data storage gm4_better_armour_stands:temp {pages:["vertical"]} positioned as @p[tag=gm4_bas_active] run tp @s ~ ~ ~
