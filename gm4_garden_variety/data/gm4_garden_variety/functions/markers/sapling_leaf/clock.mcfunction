# Executes as all sapling leaves
# @s = @e[type=marker,tag=gm4_gv_sapling_leaf]
# at @s align xyz
# run from gm4_garden_variety:main


# advancement
advancement grant @a[distance=..20] only gm4:encounter_tree

# execute as all sapling leaves
function #gm4_garden_variety:markers/sapling_leaf/clock

# execute as all broken sapling leaves
execute unless block ~ ~ ~ #minecraft:leaves run function #gm4_garden_variety:markers/sapling_leaf/destroy

# detect if sapling leaf is broken
execute unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:markers/sapling_leaf/destroy
