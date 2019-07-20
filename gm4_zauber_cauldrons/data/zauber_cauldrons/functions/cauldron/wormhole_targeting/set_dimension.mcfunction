# @s = marker area effect cloud
# at location stored in wormhole
# run from cauldron/wormhole_targeting/set_position

#forcibly load the chunk
execute store success score forceloaded gm4_zc_data run forceload query ~ ~
execute if score forceloaded gm4_zc_data matches 0 run forceload add ~ ~
execute if score forceloaded gm4_zc_data matches 0 run forceload remove ~ ~

#teleport marker to correct dimension
tp @s ~ ~ ~

#teleport player to correct dimension
tp @a[tag=gm4_zc_wormhole_consumer,limit=1] ~.5 ~.7 ~.5

#play arrival animation
particle minecraft:portal ~.5 ~1.3 ~.5 .25 .25 .25 0 100 force @a[distance=..32]
execute positioned ~.5 ~.7 ~.5 run playsound minecraft:entity.enderman.teleport player @a[distance=..8] ~ ~ ~ 1 .3
execute unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,dx=0,dy=0,dz=0] run summon tnt
