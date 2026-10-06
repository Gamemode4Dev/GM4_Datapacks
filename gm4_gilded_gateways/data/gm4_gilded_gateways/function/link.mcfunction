# @s = gateway marker of newly linked main island gateway
# at @s
# run from tick

data modify entity @s data.gm4_gilded_gateways.exit.x set from block ~ ~ ~ exit_portal[0]
data modify entity @s data.gm4_gilded_gateways.exit.y set from block ~ ~ ~ exit_portal[1]
data modify entity @s data.gm4_gilded_gateways.exit.z set from block ~ ~ ~ exit_portal[2]

function gm4_gilded_gateways:position with entity @s data.gm4_gilded_gateways.exit
