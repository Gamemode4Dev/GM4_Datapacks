# @s = player consuming wormhole_bottle
# at @s
# run from advancement zauber_cauldrons:use/wormhole

# compatibility with other modules
function #gm4_zauber_cauldrons:player/wormhole_targeting/prepare_teleport

# revoke advancement for next teleport
advancement revoke @s only gm4_zauber_cauldrons:use/wormhole

# detect main or offhand warp and prepare target coordinates in storage
data remove storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos
execute unless score $read_coordinates gm4_zc_data matches 1 if predicate gm4_zauber_cauldrons:player/equipment/wormhole/in_mainhand store success score $read_coordinates gm4_zc_data run data modify storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos set from entity @s SelectedItem.components."minecraft:custom_data".gm4_zauber_cauldrons.cauldron_pos
execute unless score $read_coordinates gm4_zc_data matches 1 if predicate gm4_zauber_cauldrons:player/equipment/wormhole/in_offhand run data modify storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".gm4_zauber_cauldrons.cauldron_pos
scoreboard players reset $read_coordinates gm4_zc_data

# backwards compatibility with old wormholes from below v1.10
# earlist version is tracked by our upgrade paths framework
execute if score zauber_cauldrons gm4_earliest_version matches ..110000 run function gm4_zauber_cauldrons:player/wormhole_targeting/translate_numeric_dimension_id with storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos

# affect player with resistance
effect give @s resistance 1 12 true

# particles and sound for depart
particle minecraft:portal ~ ~.6 ~ .25 .25 .25 0 100
playsound minecraft:entity.enderman.teleport player @a[distance=0.001..8] ~ ~ ~ 1 .3

# teleport user to destination
function gm4_zauber_cauldrons:player/wormhole_targeting/acquire_destination_context with storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos

# gm4_zc_wormhole_consumer tag used to be removed here, however, this wasn't reliable for tag removal for non-player entities.
# The tag removal is now done in the function teleport_user, making this redundant. This is just a failsafe to
# ensure players aren't left with the tag in case the dimension selection fails.
tag @s remove gm4_zc_wormhole_consumer
