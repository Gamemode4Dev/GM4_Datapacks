# @s = armor_stand to be modified
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 4

# spawn markers
execute if score $size gm4_bas_data matches 0 positioned ~ ~1.4 ~ run summon marker ^-.3 ^ ^ {CustomName:'"gm4_bas_right_arm"',Tags:["smithed.entity","smithed.strict","gm4_bas_joint","gm4_bas_right_arm","gm4_bas_marker","gm4_bas_new","gm4_bas_temp"]}
execute if score $size gm4_bas_data matches 1 positioned ~ ~.7 ~ run summon marker ^-.15 ^ ^ {CustomName:'"gm4_bas_right_arm"',Tags:["smithed.entity","smithed.strict","gm4_bas_joint","gm4_bas_right_arm","gm4_bas_marker","gm4_bas_new","gm4_bas_temp"]}

# store current data
data modify storage gm4_better_armour_stands:temp Data.Pose.RightArm set from entity @s Pose.RightArm
