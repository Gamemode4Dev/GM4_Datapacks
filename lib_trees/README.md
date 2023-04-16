# lib_trees
lib_trees is a mcfunction library that facilites the creation of custom trees. This library handles many of the functions required for growing custom trees from saplings: sapling placement and breaking, tree growth via saplings, and sapling drops from specific leaves.

## Installation
This library relies on [lantern load](https://github.com/LanternMC/load). If you don't know how to create a datapack that utilizes lantern load, refer to the [documentation](https://github.com/LanternMC/load/blob/master/README.adoc).

## Example Pack
The example datapack has everything required to use this library (except for full lantern load implementation). This document will refer to the example pack for specific details.

## Generating Trees with Worldgen
This library does not handle generation of trees via worldgen, but information of how to generate trees to be used in conjunction of this library will be outlined below.

Trees will need to be defined using custom structures. It is technically possible to use configured features (how normal trees generate), but the sapling drops become more complex. This will only outline the process using structures. Refer to the `worldgen`, `tags`, and `structures` folder of the example pack to set up custom structures.

### Leaf Markers
The most important thing for custom trees to be usable with this datapack is to add leaf markers to your trees. Leaf markers must be created with the `gm4_tree_leaf` tag and an additional identifier tag:
```mcfunction
summon marker ~ ~ ~ {Tags:["gm4_tree_leaf","LEAF_IDENTIFIER_TAG"]}
```

Markers can be placed in a few ways; this document will outline the 3 most reasonable ways.
- Place a marker in every leaf
    - This may get laggy if your trees have a lot of leaves, but will allow the tree to be "fully custom" since normal leaf drops can be deleted and replaced.
- Place a few markers manually
    - This is an option if you just want specific leaves to be able to drop saplings, but it will be the same for every tree
- Use jigsaws to randomly select where markers should generate
    - This is a better option if you don't want every leaf to have a marker, since it will allow for random leaves to have a sapling drop chance. This is the method present in the example pack.
    - During worldgen, the location of these markers will be the same when using the same seed; this can be used to your advantage if you, for example, want fruit to generate at these leaves and have that be seed random.

## Custom Saplings
### Leaf Drops
When a leaf marker is no longer in a leaf block, it will run the `#gm4_trees:destroy_leaf` function tag at the location of the leaf marker. The function tag should call a verification function to check if the marker was a custom marker from your datapack:
```mcfunction
execute if entity @s[tag=LEAF_IDENTIFIER_TAG] run function ...
```
That should run a function that drops a sapling and kills the marker (`@s`). The easiest way to drop saplings is to use a loot table to drop a custom sapling upon a specific chance, as shown in the example pack:
```mcfunction
loot spawn ~ ~ ~ loot ...
kill @s
```

### Placing Saplings
Custom sapling items need some specific data so this library knows it's a custom sapling and should be tracked when placed. You can use a command like below, or a loot table, like in the example pack. A loot table is recommended since it's more versatile.
```mcfunction
# any sapling type can be used
give @s oak_sapling{gm4_trees:{item:{id:"sapling",type:"IDENTIFIER"}}}
```

When these custom saplings are placed, the library will find the placed sapling and run the `#gm4_trees:initialize_sapling` function tag at the location of the sapling. The function tag should call a verification function to check if the sapling was a custom sapling from your datapack:
```mcfunction
execute if data storage gm4_trees:temp sapling{type:"IDENTIFIER"} run function ...
```
That should run a function that summons a marker with the `gm4_tree_sapling` tag and an additional identifier tag, and then sets its `gm4_sap_growth` score to a positive number. This score increases every time the sapling increases its `Age` block state. Vanilla saplings have 2 growth stages until they grow into a tree.
```mcfunction
# this marker must be spawned at the center of the block (which is where it's run from)
summon marker ~ ~ ~ {Tags:["gm4_tree_sapling","SAPLING_ID_TAG"]}
# set stage requirement (higher = longer to grow)
scoreboard players set @e[type=marker,tag=SAPLING_ID_TAG,distance=..0.1] gm4_sap_growth 2
```

### Breaking Saplings
When a custom sapling is broken, the `#gm4_trees:destroy_sapling` function tag is run from the sapling marker. The function tag should call a verification function to check if the sapling marker was a custom sapling from your datapack:
```mcfunction
execute if entity @s[tag=SAPLING_ID_TAG] run function ...
```
That should run a function that replaces the normal item with the custom sapling item:
```mcfunction
# any sapling type can be used (as long as it matches the custom item)
kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:oak_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
loot spawn ~ ~ ~ loot gm4_trees_example:items/apple_tree_sapling
```

### Growing Saplings
Custom saplings can be grown like vanilla saplings. The growth is based on the block state of the sapling, so bonemeal can be used like normal. When the age reaches the sapling marker's `gm4_sap_growth` score, it will generate a tree. When this happens, the `#gm4_trees:generate_tree` function tag will run at the location of the sapling marker. The function tag should call a verification function to check if the sapling was a custom sapling from your datapack:
```mcfunction
execute if entity @s[tag=SAPLING_ID_TAG] run function ...
```
That should run a function that generates the tree using `/place jigsaw` then kills the marker (`@s`):
```mcfunction
# generate tree using custom structure
place jigsaw gm4_trees_example:apple_trees gm4_trees:trunk 6 ~ ~1 ~
kill @s
```
