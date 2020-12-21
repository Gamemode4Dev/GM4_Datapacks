# places an apple leaf
# @s = TODO
# at @s align xyz
# run from TODO

# place leaf block
fill ~ ~ ~ ~ ~ ~ oak_leaves[persistent=false] replace #gm4_apple_trees:tree_replaceable

# place marker entity
summon armor_stand ~0.5 ~-1.9 ~0.5 {Tags:["gm4_fruiting_leaf_new","gm4_fruiting_leaf","gm4_apple_leaf","gm4_ripe_apple"],Small:0b,Invisible:1b,Invulnerable:1b,NoGravity:1,DisabledSlots:65598,HandItems:[{id:"minecraft:apple",Count:1b},{}],Pose:{RightArm:[0.0f,270.0f,270.0f]}}
execute as @e[type=armor_stand,tag=gm4_fruiting_leaf_new,limit=1] run function gm4_apple_trees:tree/leaf/fruiting/initialize
