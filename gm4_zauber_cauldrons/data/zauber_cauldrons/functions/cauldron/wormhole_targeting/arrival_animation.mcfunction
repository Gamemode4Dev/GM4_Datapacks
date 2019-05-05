# @s player consuming wormhole_bottle
# at @s in depending on call
# run from cauldron/wormhole_targeting/teleport_to_dimension

#particles and sound
particle minecraft:portal ~ ~.6 ~ .25 .25 .25 0 100
playsound minecraft:entity.enderman.teleport player @a[distance=..8] ~ ~ ~ 1 .3

#explosion if no cauldron in target block
execute align xyz unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,dx=0,dy=0,dz=0] run summon tnt
execute align xyz unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,dx=0,dy=0,dz=0] run playsound minecraft:entity.generic.explode block @s
