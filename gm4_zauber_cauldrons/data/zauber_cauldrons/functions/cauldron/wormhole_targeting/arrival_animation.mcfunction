# @s player consuming wormhole_bottle
# at @s (after teleport)
# run from cauldron/wormhole_targeting/choose_dimension

#particles and sound
particle portal ~ ~.6 ~ .25 .25 .25 0 100
playsound entity.enderman.teleport player @a[distance=..8] ~ ~ ~ 1 .3

#explosion if no cauldron in target block
execute align xyz unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,dx=0,dy=0,dz=0] run summon tnt
execute align xyz unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,dx=0,dy=0,dz=0] run playsound entity.generic.explode block @s
