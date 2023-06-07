# restores the data of the sapling when breaking the block
# @s = apple tree sapling marker
# located at @s
# run from gm4_apple_trees:verify/destroy_sapling

execute align xyz store success score $dropped_item gm4_apple_data run kill @e[type=item,nbt={Item:{id:"minecraft:oak_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
execute if score $dropped_item gm4_apple_data matches 1.. run loot spawn ~ ~ ~ loot gm4_apple_trees:items/apple_tree_sapling
scoreboard players reset $dropped_item gm4_apple_data
