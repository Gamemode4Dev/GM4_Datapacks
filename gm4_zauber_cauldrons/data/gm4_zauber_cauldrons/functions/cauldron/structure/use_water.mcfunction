# @s = zauber cauldron
# run from recipe check functions

# use water
execute if block ~ ~ ~ minecraft:water_cauldron[level=1] run setblock ~ ~ ~ minecraft:cauldron
execute if block ~ ~ ~ minecraft:water_cauldron[level=2] run setblock ~ ~ ~ minecraft:water_cauldron[level=1]
execute if block ~ ~ ~ minecraft:water_cauldron[level=3] run setblock ~ ~ ~ minecraft:water_cauldron[level=2]

# use powder snow
execute if block ~ ~ ~ minecraft:powder_snow_cauldron[level=1] run setblock ~ ~ ~ minecraft:water_cauldron[level=1]
execute if block ~ ~ ~ minecraft:powder_snow_cauldron[level=2] run setblock ~ ~ ~ minecraft:water_cauldron[level=2]
execute if block ~ ~ ~ minecraft:powder_snow_cauldron[level=3] run setblock ~ ~ ~ minecraft:water_cauldron[level=3]

# particle
particle minecraft:splash ~ ~ ~ .15 0.1 .15 0 6
