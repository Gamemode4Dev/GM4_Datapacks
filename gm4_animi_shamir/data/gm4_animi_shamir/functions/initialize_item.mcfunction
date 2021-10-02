# sets the item's data from cache
# @s = @e[type=item,tag=gm4_respawned_animi_item,limit=1]
# at owner player location
# run from gm4_animi_shamir:item_caching/unpack_entry

# set owner
data modify entity @s Owner set from storage gm4_animi_shamir:cache prepared_entry.owner

# copy NBT
data modify entity @s Item set from storage gm4_animi_shamir:cache prepared_entry.inventory[0]

# remove tag
tag @s remove gm4_respawned_animi_item
