# places a TREE_TYPE fruit marker
# run from TODO

# randomly set the armor stands rotation
function gm4_garden_variety:utility/generate/next_seed_value
scoreboard players operation fruit_direction gm4_gv_tree_gen = $current_seed gm4_gv_tree_gen
scoreboard players operation fruit_direction gm4_gv_tree_gen %= #4 gm4_gv_math_num

# place fruit marker based on direction
execute if score fruit_direction gm4_gv_tree_gen matches 0 align xyz run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Leaf"',Tags:["gm4_fruiting_leaf_new"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[0.0f,0.0f]}
execute if score fruit_direction gm4_gv_tree_gen matches 1 align xyz run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Leaf"',Tags:["gm4_fruiting_leaf_new"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[90.0f,0.0f]}
execute if score fruit_direction gm4_gv_tree_gen matches 2 align xyz run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Leaf"',Tags:["gm4_fruiting_leaf_new"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[180.0f,0.0f]}
execute if score fruit_direction gm4_gv_tree_gen matches 3 align xyz run summon armor_stand ~0.5 ~-.9 ~0.5 {CustomName:'"Apple Leaf"',Tags:["gm4_fruiting_leaf_new"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,Pose:{RightArm:[0.0f,270.0f,270.0f]},Rotation:[270.0f,0.0f]}

# initialize
execute as @e[type=armor_stand,tag=gm4_fruiting_leaf_new,limit=1] at @s run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/apple/initialize
