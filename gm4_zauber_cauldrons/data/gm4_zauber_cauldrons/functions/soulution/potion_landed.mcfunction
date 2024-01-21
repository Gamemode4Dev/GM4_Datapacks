# spawn copy of potion with one use less when a zauber splash soulution hits the ground
# @s = @e[type=marker,tag=gm4_potion_tracker]
# at @s
# run from zauber_cauldrons:soulution/thrown_potion_tracking/verify_potion_nbt

# pull data of thrown potion into storage
data modify storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item set from storage gm4_potion_tracking:temp entity_data.Item

# set to use throws instead of sips
scoreboard players set $use_alternative_sips gm4_zc_data 1

# check remaining sips
execute store result score $remaining_sips gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.tag.gm4_zauber_cauldrons.bottle.sips
execute if score $remaining_sips gm4_zc_data matches 2.. run function gm4_zauber_cauldrons:soulution/spawn_copy

# reset fake players and storage
scoreboard players reset $remaining_sips gm4_zc_data
scoreboard players reset $use_alternative_sips gm4_zc_data
data remove storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item
