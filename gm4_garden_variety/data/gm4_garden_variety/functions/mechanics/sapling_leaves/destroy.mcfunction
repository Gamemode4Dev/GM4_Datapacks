# Modifies the saplings dropped from sapling leaves
# @s = @e[type=marker,tag=gm4_gv_sapling_leaf]
# at @s align xyz
# run from gm4_garden_variety:markers/sapling_leaf/clock


# destroy leaves
execute unless block ~ ~ ~ #minecraft:leaves run function #gm4_garden_variety:mechanics/sapling_leaves/destroy

# store nbt from passed on mutations
data modify storage gm4_garden_variety:transfer/gv_nbt sapling_leaf set from entity @s data.gm4_garden_variety
data remove storage gm4_garden_variety:transfer/gv_nbt sapling_leaf.lore
execute as @e[type=item,distance=..1,sort=nearest,nbt={Age:0s}] run data modify entity @s Item.tag.gm4_garden_variety set from storage gm4_garden_variety:transfer/gv_nbt sapling_leaf

# kill
kill @s
