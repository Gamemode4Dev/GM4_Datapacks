# translates a numeric dimension id from the forceload library to the dimension name as a string for backwards compatibility with old wormholes
# @s = player consuming wormhole_bottle
# at @s
# run from player/wormhole_targeting/prepare_teleport

# this macro function will fail to instantiate if $(dimension) does not contain a number, as the score ... matches expects a number, not a string.
# as a result, this function will not run if a string is stored in $(dimension)

# find dimension marker with matching id and get its name (the name will be something like '"minecraft:overworld"')
$execute as @e[type=marker,tag=gm4_dimension] if score @s gm4_dimension matches $(dimension) run tag @s add gm4_zc_targeted_dimension
data modify storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos.dimension set from entity @e[type=marker,tag=gm4_zc_targeted_dimension,limit=1] CustomName

# the name stored is still encased by speechmarks, which we need to remove
function gm4_zauber_cauldrons:player/wormhole_targeting/remove_speechmarks with storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos

# remove tag
tag @e[type=marker,tag=gm4_dimension] remove gm4_zc_targeted_dimension
