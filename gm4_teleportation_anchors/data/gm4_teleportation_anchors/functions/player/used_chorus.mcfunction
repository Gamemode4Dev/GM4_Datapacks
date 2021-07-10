# @s = player who ate chorus fruit
# run from advancement "consume_chorus" and any module that supports jamming (e.g. Wormholes, Expeditious)

advancement revoke @s only gm4_teleportation_anchors:consume_chorus

execute if entity @s[tag=gm4_ta_jammed,tag=!gm4_ta_teleported_player] run function gm4_teleportation_anchors:player/jam_player
