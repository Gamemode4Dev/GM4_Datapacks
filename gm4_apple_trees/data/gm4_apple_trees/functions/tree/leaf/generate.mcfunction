# generates a new apple tree leaf
# @s = TODO
# at @s align xyz
# run from TODO


# NOT DONE

# generate leaf block
setblock ~ ~ ~ minecraft:oak_leaves[persistent=false] replace

# when on layer 3, decide whether this should be an fertile leaf
execute if score $current_layer gm4_apple_layer = @s gm4_apple_layer run function #gm4_fruiting_trees:tree/leaf/check_fruit_type
# generate marker entity
summon area_effect_cloud ~ ~ ~ {CustomName:'"gm4_apple_leaf"',Tags:["gm4_apple_leaf"],Duration:2147483647,Radius:0}
