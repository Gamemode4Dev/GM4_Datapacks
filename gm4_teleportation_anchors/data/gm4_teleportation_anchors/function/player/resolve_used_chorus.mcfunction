# check load.status
# @s = player who ate chorus fruit
# located at @s
# run from #gm4_zauber_cauldrons:player/wormhole_targeting/prepare_teleport

execute if score gm4_teleportation_anchors load.status matches 1.. run function gm4_teleportation_anchors:player/used_chorus
