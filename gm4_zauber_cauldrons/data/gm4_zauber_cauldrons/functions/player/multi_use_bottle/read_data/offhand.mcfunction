# @s = player holding a multi_use_bottle in the offhand
# at world spawn
# run from player/multi_use_bottle/cache/populate

# copy offhand wormhole x, y, z, and dimension to the temporary data storage
data modify entity @e[type=item,tag=gm4_zc_new_nbt_storage,limit=1] Item set from entity @s Inventory[{Slot:-106b}]

# set flag to remember offhand operation across ticks
tag @s add gm4_zc_used_offhand
