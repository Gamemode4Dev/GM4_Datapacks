# COMMENTS


# advancement
advancement grant @a[distance=..20] only gm4:encounter_tree

# execute as all sapling leaves
function #gm4_garden_variety:markers/sapling_leaf/clock

# detect if sapling leaf is broken
execute unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:markers/sapling_leaf/destroy
