# @s = player to check for wormhole bottles
# at world spawn
# run from player/multi_use_bottle/take_sip

# read data of mainhand and/or offhand if applicable
execute if predicate gm4_zauber_cauldrons:player/equipment/multi_use_bottle/in_mainhand run function gm4_zauber_cauldrons:player/multi_use_bottle/read_mainhand_data
execute unless score $read_data gm4_zc_data matches 1 if predicate gm4_zauber_cauldrons:player/equipment/multi_use_bottle/in_offhand run function gm4_zauber_cauldrons:player/multi_use_bottle/read_offhand_data
# reset fake player
scoreboard players reset $read_data gm4_zc_data
