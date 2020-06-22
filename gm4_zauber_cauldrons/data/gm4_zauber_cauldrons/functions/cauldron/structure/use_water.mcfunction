# @s=zauber cauldron
# run from recipe check functions

# use water
execute if block ~ ~ ~ cauldron[level=1] run setblock ~ ~ ~ cauldron[level=0]
execute if block ~ ~ ~ cauldron[level=2] run setblock ~ ~ ~ cauldron[level=1]
execute if block ~ ~ ~ cauldron[level=3] run setblock ~ ~ ~ cauldron[level=2]

# particle
particle minecraft:splash ~ ~ ~ .15 0 .15 0 6
