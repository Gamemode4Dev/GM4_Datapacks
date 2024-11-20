# @s = user to pe teleported by wormhole
# at target location of wormhole (center of block)
# run from player/wormhole_targeting/acquire_destination_context

# forcibly load the chunk
execute store success score $forceloaded gm4_zc_data run forceload query ~ ~
execute if score $forceloaded gm4_zc_data matches 0 run forceload add ~ ~
execute if score $forceloaded gm4_zc_data matches 0 run forceload remove ~ ~

# teleport
tp @s ~ ~.2 ~

# play arrival animation
particle minecraft:portal ~ ~.8 ~ .25 .25 .25 0 100 force @a[distance=..32]
execute positioned ~ ~.7 ~ run playsound minecraft:entity.enderman.teleport player @a[distance=..8] ~ ~ ~ 1 .3

# explode user if no cauldron is present
# in future versions it may be required to wait until the chunks is loaded until the block check is done,
# but as of 1.20.4 this seems to work just fine in combination with the forceload command above
execute unless entity @e[tag=gm4_zc_wormhole_consumer,scores={gm4_zc_no_explode=1..},limit=1] unless block ~ ~ ~ #minecraft:cauldrons run summon tnt ~.5 ~.7 ~.5

# reset fake player
scoreboard players reset $forceloaded gm4_zc_data

# remove tag
# Testing in 1.16.5 showed that, for non-player entities, the tag isn't removed as expected in prepare_teleport line 30.
# This lead to entities with leftover tags, which would break teleportation server wide, as those entities might be teleported instead.
# Keep testing whether this is still necessary in future versions.
# Note that this would not be an issue in vanilla zauber, however, zauber liquids allows the teleportation of non-player entities.
tag @s remove gm4_zc_wormhole_consumer
