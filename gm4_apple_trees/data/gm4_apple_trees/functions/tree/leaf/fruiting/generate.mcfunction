# places an apple leaf
# @s = TODO
# at @s align xyz
# run from TODO

# calculate the armor stands rotation based on random bits
## uses two bits of positioal data and one tree bit to find a 0-3 value, one for each possible rotation
scoreboard players operation $apple_facing gm4_apple_data = $angle gm4_apple_data
scoreboard players set #4 gm4_apple_data 4
scoreboard players operation $apple_facing gm4_apple_data /= #4 gm4_apple_data
scoreboard players operation $apple_facing gm4_apple_data += $radius gm4_apple_data
scoreboard players operation $apple_facing gm4_apple_data += $bit2 gm4_tree_seed

# place marker entity, rotated based on seed info
execute if score $apple_facing gm4_apple_data matches 0 run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Tree Leaf"',Tags:["gm4_fruiting_leaf_new","gm4_no_edit"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[0.0f,0.0f]}
execute if score $apple_facing gm4_apple_data matches 1 run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Tree Leaf"',Tags:["gm4_fruiting_leaf_new","gm4_no_edit"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[90.0f,0.0f]}
execute if score $apple_facing gm4_apple_data matches 2 run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Tree Leaf"',Tags:["gm4_fruiting_leaf_new","gm4_no_edit"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[180.0f,0.0f]}
execute if score $apple_facing gm4_apple_data matches 3 run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Tree Leaf"',Tags:["gm4_fruiting_leaf_new","gm4_no_edit"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[270.0f,0.0f]}

execute as @e[type=armor_stand,tag=gm4_fruiting_leaf_new,limit=1] at @s run function gm4_apple_trees:tree/leaf/fruiting/initialize
