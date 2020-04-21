# @s = player that consumed any multi_use_bottle 1 tick ago
# at @s
# run from player/multi_use_bottle/restore_context

# move id of player to fake player
scoreboard players operation requested_id gm4_zc_id = @s gm4_zc_id

# move matching item data from stored entity into storage
execute as @e[type=item,tag=gm4_zc_nbt_storage,limit=1] if score @s gm4_zc_id = requested_id gm4_zc_id run data modify storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item set from entity @s Item

# modify data
execute store result score remaining_sips gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.tag.gm4_zauber_cauldrons.bottle.sips
scoreboard players remove remaining_sips gm4_zc_data 1
execute if score remaining_sips gm4_zc_data matches 2 run function gm4_zauber_cauldrons:player/multi_use_bottle/update_data/level_2
execute if score remaining_sips gm4_zc_data matches 1 run function gm4_zauber_cauldrons:player/multi_use_bottle/update_data/level_1

execute store result storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.tag.gm4_zauber_cauldrons.bottle.sips byte 1 run scoreboard players get remaining_sips gm4_zc_data
data modify storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item.Slot set value 0b

# move data into shulker box at -32 2 -32
data modify block -32 2 -32 Items append from storage gm4_zauber_cauldrons:temp/item/multi_use_bottle Item

# return modified items to player inventory, depending on offhand or mainhand use
execute if entity @s[tag=gm4_zc_used_mainhand] run loot replace entity @s weapon.mainhand 1 mine -32 2 -32 minecraft:air{drop_contents: 1b}
execute if entity @s[tag=gm4_zc_used_offhand] run loot replace entity @s weapon.offhand 1 mine -32 2 -32 minecraft:air{drop_contents: 1b}

# revoke advancement
advancement revoke @s only gm4_zauber_cauldrons:use/multi_use_bottle

# reset tags
tag @s remove gm4_zc_used_mainhand
tag @s remove gm4_zc_used_offhand
