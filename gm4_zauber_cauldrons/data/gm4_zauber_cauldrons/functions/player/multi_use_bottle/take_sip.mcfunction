# @s = player consuming any multi_use_bottle
# at @s
# run from player/multi_use_bottle/check_gamemode

# save coordinates into entity
summon item ~ -128 ~ {Item:{id:"minecraft:potion",Count:1b},Tags:["gm4_zc_new_nbt_storage","gm4_zc_nbt_storage"],Age:5999,PickupDelay:32767}
scoreboard players operation @e[type=item,tag=gm4_zc_new_nbt_storage,limit=1] gm4_zc_id = @s gm4_zc_id
function gm4_zauber_cauldrons:player/multi_use_bottle/read_data

# remove tags
tag @e[type=item,tag=gm4_zc_nbt_storage] remove gm4_zc_new_nbt_storage

# schedule delayed action
schedule function gm4_zauber_cauldrons:player/multi_use_bottle/restore_context 1t replace
