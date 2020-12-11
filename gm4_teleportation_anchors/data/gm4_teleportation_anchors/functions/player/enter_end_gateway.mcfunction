# @s = player who just entered an end gateway
# run from advancement "enter_end_gateway"

advancement revoke @s only gm4_teleportation_anchors:enter_end_gateway

tag @s[tag=gm4_ta_jammed] add gm4_ta_gateway
execute if entity @s[tag=gm4_ta_jammed] run function gm4_teleportation_anchors:player/jam_player
