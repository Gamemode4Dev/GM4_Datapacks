# summons the sapling marker
# @s = player who placed the custom sapling
# located align xyz of the newly placed sapling
# run from gm4_trees:sapling/place_sapling

# set up storage to be read from
# mainhand
data modify storage gm4_trees:temp sapling.type set from entity @s SelectedItem.components."minecraft:custom_data".gm4_trees.item.type
## backwards compatibility with old items
execute unless data storage gm4_trees:temp sapling run data modify storage gm4_trees:temp sapling.type set from entity @s SelectedItem.components."minecraft:custom_data".gm4_fruiting_trees.item.type

# offhand
execute unless data storage gm4_trees:temp sapling run data modify storage gm4_trees:temp sapling.type set from entity @s equipment.offhand.components."minecraft:custom_data".gm4_trees.item.type
## backwards compatibility with old items
execute unless data storage gm4_trees:temp sapling run data modify storage gm4_trees:temp sapling.type set from entity @s equipment.offhand.components."minecraft:custom_data".gm4_fruiting_trees.item.type

# call initialize function so other modules can add their markers
# | NOTE positioned ~.5 ~.5 ~.5 to not break data packs that relied on this behavior of old versions of this library
execute positioned ~.5 ~.5 ~.5 run function #gm4_trees:initialize_sapling

# clean up
data remove storage gm4_trees:temp sapling

# signal that a sapling was found
return 1
