# @s = zauber cauldron
# run from cauldron/structure/modify

# use water
execute if block ~ ~ ~ minecraft:water_cauldron[level=1] run setblock ~ ~ ~ minecraft:cauldron
execute if block ~ ~ ~ minecraft:water_cauldron[level=2] run setblock ~ ~ ~ minecraft:water_cauldron[level=1]
execute if block ~ ~ ~ minecraft:water_cauldron[level=3] run setblock ~ ~ ~ minecraft:water_cauldron[level=2]

# particle
particle minecraft:splash ~ ~ ~ .15 0.1 .15 0 6

# sound
playsound minecraft:item.bucket.fill block @a[distance=..8] ~ ~ ~ 0.5 0.75
