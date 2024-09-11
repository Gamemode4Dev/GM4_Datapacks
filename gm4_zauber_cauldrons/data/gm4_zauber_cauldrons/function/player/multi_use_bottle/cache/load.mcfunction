# @s = player that consumed any multi_use_bottle 1 tick ago
# at @s
# run from player/multi_use_bottle/restore_context

# move id of player to fake player
scoreboard players operation $requested_id gm4_zc_id = @s gm4_zc_id

# move matching item data from stored entity into storage
execute as @e[type=item,tag=gm4_zc_nbt_storage] if score @s gm4_zc_id = $requested_id gm4_zc_id run function gm4_zauber_cauldrons:player/multi_use_bottle/cache/dump

# abort execution if one or less sips are remaining
execute store result score $remaining_sips gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.components."minecraft:custom_data".gm4_zauber_cauldrons.bottle.sips
execute if score $remaining_sips gm4_zc_data matches 2.. run function gm4_zauber_cauldrons:player/multi_use_bottle/modify_bottle

# revoke advancement
advancement revoke @s only gm4_zauber_cauldrons:use/multi_use_bottle

# reset storage
data remove storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item

# reset tags
tag @s remove gm4_zc_used_mainhand
tag @s remove gm4_zc_used_offhand
scoreboard players reset $remaining_sips gm4_zc_data
