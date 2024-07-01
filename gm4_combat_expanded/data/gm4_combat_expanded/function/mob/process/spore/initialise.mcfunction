# tag spore item as spore
# @s = spore item
# at unspecified
# run from check_item

tag @s add gm4_ce_spore
data merge entity @s {Age:-32768,PickupDelay:32767,Health:4f}
execute if items entity @s contents minecraft:cherry_leaves run tag @s add gm4_ce_spore.cherry
