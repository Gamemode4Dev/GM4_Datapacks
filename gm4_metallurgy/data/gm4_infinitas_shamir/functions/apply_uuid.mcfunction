# Applies the item entity UUID into the Bucket's nbt to prevent empty buckets from stacking
# @s = item to receive the shamir
# @e[tag=gm4_ml_source] = shamir item
# called from #gm4_metallurgy:apply_band

data modify entity @s Item.tag.gm4_metallurgy.uuid set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] UUID
