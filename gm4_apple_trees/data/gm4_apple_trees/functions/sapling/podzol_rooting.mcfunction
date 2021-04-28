# plants apple tree saplings to be planted with podzol rooting soil
# @s = any sapling item that was rooted with podzol_rooting_soil
# at @s
# run from #gm4_podzol_rooting_soil:plant_custom_sapling

execute if entity @s[nbt={Item:{tag:{gm4_podzol_rooting_soil:{id:"apple_tree_sapling"}}}}] align xyz run function gm4_apple_trees:sapling/initialize
