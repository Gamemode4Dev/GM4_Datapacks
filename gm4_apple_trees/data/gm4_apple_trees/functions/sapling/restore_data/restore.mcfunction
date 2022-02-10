# restores the data of the sapling when breaking the block
# @s apple tree sapling marker
# at @s align xyz
# run from gm4_apple_trees:sapling/restore_data/validate_species

execute store success score $kill_success gm4_apple_data run kill @e[type=item,nbt={Item:{id:"minecraft:oak_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
execute if score $kill_success gm4_apple_data matches 1.. run loot spawn ~0.5 ~0.5 ~0.5 loot gm4_apple_trees:items/apple_tree_sapling
scoreboard players reset $kill_success gm4_apple_data
