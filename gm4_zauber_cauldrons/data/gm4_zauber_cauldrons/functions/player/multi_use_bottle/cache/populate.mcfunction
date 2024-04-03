# @s = player consuming any multi_use_bottle
# at @s
# run from player/multi_use_bottle/check_gamemode

# save coordinates into id'd entity
execute in overworld run summon item 29999998 1 7134 {Item:{id:"minecraft:potion",count:1},Tags:["gm4_zc_new_nbt_storage","gm4_zc_nbt_storage"],Age:5400,PickupDelay:32767}
scoreboard players operation @e[type=item,tag=gm4_zc_new_nbt_storage,limit=1] gm4_zc_id = @s gm4_zc_id

# read item data from hand into entity
execute if predicate gm4_zauber_cauldrons:player/equipment/multi_use_bottle/in_mainhand run function gm4_zauber_cauldrons:player/multi_use_bottle/read_data/mainhand
execute unless score $read_data gm4_zc_data matches 1 if predicate gm4_zauber_cauldrons:player/equipment/multi_use_bottle/in_offhand run function gm4_zauber_cauldrons:player/multi_use_bottle/read_data/offhand
scoreboard players reset $read_data gm4_zc_data
tag @e[type=item,tag=gm4_zc_nbt_storage] remove gm4_zc_new_nbt_storage

# schedule delayed action
schedule function gm4_zauber_cauldrons:player/multi_use_bottle/restore_context 1t replace
