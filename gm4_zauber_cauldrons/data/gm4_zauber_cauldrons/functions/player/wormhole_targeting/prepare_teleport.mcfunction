# @s = player consuming wormhole_bottle
# at @s
# run from advancement zauber_cauldrons:use/wormhole

# revoke advancement for next teleport
advancement revoke @s only gm4_zauber_cauldrons:use/wormhole

# detect main or offhand warp and prepare target coordinates in fake players
function gm4_zauber_cauldrons:player/wormhole_targeting/read_target_coordinates

# affect player with resistance
execute unless data entity @s ActiveEffects[{Id:11b,Ambient:0b}] run effect give @s resistance 1 12 true

# particles and sound for depart
particle minecraft:portal ~ ~.6 ~ .25 .25 .25 0 100
playsound minecraft:entity.enderman.teleport player @a[distance=0.001..8] ~ ~ ~ 1 .3

# summon marker for teleportation
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_zc_wormhole_target","gm4_zc_new_wormhole_target"],Duration:1}

# teleport the player to the wormhole's destination using the marker
tag @s add gm4_zc_wormhole_consumer
execute as @e[type=area_effect_cloud,tag=gm4_zc_new_wormhole_target,limit=1] run function gm4_zauber_cauldrons:player/wormhole_targeting/set_position

# gm4_zc_wormhole_consumer tag used to be removed here, however, this wasn't reliable for tag removal for non-player entities.
# The tag removal is now done in the function teleport_user, making this redundant. This is just a failsafe to
# ensure players aren't left with the tag in case the dimension selection fails.
tag @s remove gm4_zc_wormhole_consumer
