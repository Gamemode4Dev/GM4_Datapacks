# Executes as all sapling leaves
# @s = @e[type=marker,tag=gm4_gv_sapling_leaf]
# at @s align xyz
# run from gm4_garden_variety:main


# advancement
advancement grant @a[distance=..20] only gm4:encounter_gv_tree

# execute as all sapling leaves
function #gm4_garden_variety:mechanics/sapling_leaves/clock

# execute as all broken sapling leaves
execute unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:mechanics/sapling_leaves/destroy
