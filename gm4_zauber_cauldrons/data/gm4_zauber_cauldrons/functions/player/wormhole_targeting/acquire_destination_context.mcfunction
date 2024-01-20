# sets the execution location to the destination of the wormhole used
# @s = user to pe teleported by wormhole
# at @s
# run from player/wormhole_targeting/prepare_teleport

# insert coordinates and dimension, make sure coordinates are center-of-block coordinates
$execute in $(dimension) positioned $(x) $(y) $(z) align xyz positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:player/wormhole_targeting/teleport_user
