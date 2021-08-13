# COMMENTS


# store nbt from passed on mutations
data modify storage gm4_garden_variety:data/garden_variety_nbt leaf_dropped_sapling set from entity @s data.gm4_garden_variety
data remove storage gm4_garden_variety:data/garden_variety_nbt leaf_dropped_sapling.lore
execute as @e[type=item,distance=..1,sort=nearest,nbt={Age:0s}] run data modify entity @s Item.tag.gm4_garden_variety set from storage gm4_garden_variety:data/garden_variety_nbt leaf_dropped_sapling

# kill
kill @s
