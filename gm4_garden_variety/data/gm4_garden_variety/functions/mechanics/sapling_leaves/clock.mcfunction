# processes the leaf to check if the block has been broken
# @s = @e[type=marker,tag=gm4_gv_sapling_leaf]
# at @s align xyz
# run from gm4_garden_variety:clock/16t


# advancement
advancement grant @a[distance=..20] only gm4:encounter_gv_tree

# adds additional expansion features
function #gm4_garden_variety:mechanics/sapling_leaves/clock

# execute as all broken sapling leaves
execute unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:mechanics/sapling_leaves/destroy
