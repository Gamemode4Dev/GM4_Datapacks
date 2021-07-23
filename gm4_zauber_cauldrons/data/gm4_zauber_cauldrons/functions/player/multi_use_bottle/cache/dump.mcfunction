# @s = gm4_zc_nbt_storage item spawned in a previous tick. This item carries the 'tag' of the multi use bottles that was used
# at location of player that drank this bottle
# run from player/multi_use_bottle/cache/load

# pull data into storage
data modify storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item set from entity @s Item

# remove first lore line
# this line holds sips/max line, should be ignored as this line is dynamically generated 
# and added by the item modifier gm4_zauber_cauldrons:player/multi_use_bottle/update_sips
data remove storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.tag.display.Lore[0]

# kill item
kill @s
