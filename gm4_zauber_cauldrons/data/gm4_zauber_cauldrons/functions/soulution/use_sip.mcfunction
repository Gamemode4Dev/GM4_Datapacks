# Removes one sip from a soulution stored in storage gm4_zauber_cauldrons:temp/item/multi_use_bottle. Utility function called from multiple locations.
# @s = varies, check calling functions
# at varies, check calling functions
# run from player/multi_use_bottle/modify_bottle and 

# NOTE:
# Before calling this function, a couple of steps must be taken by the calling function to prepare
# scores and storages. These are:
# 1) Fake player $remaining_sips in gm4_zc_data must be set to the amount of uses left on the soulution (the amount before a sip was used!).
#    This fake player should be reset by the calling function afterwards.
# 2) Storage gm4_zauber_cauldrons:temp/item/multi_use_bottle must have item-formatted nbt
#    (like entries inside the Items array of containers, or the Item nb tag on item entities) in the nb tag 'Item'.
#    This nbt will be used as a base for the item with one sip removed. Note that the first line of lore will be overwritten by the new
#    sip information. This storage should be reset by the calling function afterwards via storage remove <...>.
# 3) Fake player $use_alternative_sips in gm4_zc_data must be set to 1 if 'throws' should be displayed instead of 'sips'. This is a purely visual change.
#    This fake player should be reset by the calling function afterwards.
#
# The item with the updated sip information will be placed in slot 0 of the yellow shulker box at minecraft:overworld 29999998 1 7134 (see lib_forceload),
# from where the calling function must then immediately use it (waiting even for a single tick may cause the item to be overwritten).
#
# This function does not implement any sort of safeguard reagarding invalid sip amounts, i.e. the calling function must ensure there are still sips
# left to be used on the soulution, e.g. by checking whether there were at least two sips remaining before the soulution was used.


# remove first lore line
# this line should hold sips/max line, and should be ignored as this line is dynamically generated 
# and added by the item modifier gm4_zauber_cauldrons:soulution/update_sips
data remove storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.tag.display.Lore[0]

# subtract one sip
scoreboard players remove $remaining_sips gm4_zc_data 1
execute store result storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.tag.gm4_zauber_cauldrons.bottle.sips int 1 run scoreboard players get $remaining_sips gm4_zc_data

# set slot information to target slot 0 in the yellow shulker box
data modify storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.Slot set value 0b

# move data into shulker box at 29999998 1 7134 (gamemode 4 lib_forceload standard)
execute in overworld run data modify block 29999998 1 7134 Items append from storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item

# update lore
scoreboard players add $use_alternative_sips gm4_zc_data 0
item modify block 29999998 1 7134 container.0 gm4_zauber_cauldrons:soulution/update_sips
