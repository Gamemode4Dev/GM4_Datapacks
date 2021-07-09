# @s = gm4_zc_nbt_storage item spawned in a previous tick. This item carries the 'tag' of the multi use bottles that was used
# at location of player that drank this bottle
# run from player/multi_use_bottle/cache/load

# pull data into storage
data modify storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item set from entity @s Item

# kill item
kill @s
