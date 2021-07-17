# @s = player consuming wormhole_bottle
# at @s
# run from advancement zauber_cauldrons:use/wormhole

# compatibility with teleportation anchors
execute if score gm4_teleportation_anchors load.status matches 1.. run function gm4_teleportation_anchors:player/used_chorus

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
tag @s remove gm4_zc_wormhole_consumer
