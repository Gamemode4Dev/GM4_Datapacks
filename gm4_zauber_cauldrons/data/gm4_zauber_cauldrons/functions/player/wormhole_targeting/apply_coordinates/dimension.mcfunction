# @s = marker area effect cloud
# at location stored in wormhole
# run from player/wormhole_targeting/apply_coordinates/position

# forcibly load the chunk
execute store success score $forceloaded gm4_zc_data run forceload query ~ ~
execute if score $forceloaded gm4_zc_data matches 0 run forceload add ~ ~
execute if score $forceloaded gm4_zc_data matches 0 run forceload remove ~ ~

# teleport marker to correct dimension
tp @s ~ ~ ~

# teleport player to correct dimension
execute as @e[tag=gm4_zc_wormhole_consumer,limit=1] run function gm4_zauber_cauldrons:player/wormhole_targeting/teleport_user

# play arrival animation
particle minecraft:portal ~.5 ~1.3 ~.5 .25 .25 .25 0 100 force @a[distance=..32]
execute positioned ~.5 ~.7 ~.5 run playsound minecraft:entity.enderman.teleport player @a[distance=..8] ~ ~ ~ 1 .3
execute unless entity @e[tag=gm4_zc_wormhole_consumer,scores={gm4_zc_no_explode=1..},limit=1] unless block ~ ~ ~ #minecraft:cauldrons run summon tnt ~.5 ~.7 ~.5
# TODO: wait for chunk to load
