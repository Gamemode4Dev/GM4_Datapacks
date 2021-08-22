# displays a single frame of the creation animation
# @s = animation marker
# at @s
# run from gm4_zauber_cauldron:cauldron/setup/animation/controller

# move to new position
teleport @s ^0.15 ^ ^0.025 facing entity @e[type=marker,tag=gm4_zauber_cauldron,distance=..1,limit=1]

# display particle
execute at @s run particle minecraft:enchant ~ ~0.6 ~ 0 0 0 0.001 1
