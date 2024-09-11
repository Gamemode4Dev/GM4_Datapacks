# places a wheat plant
# @s = player requesting wheat planting
# at item planting location
# run from gm4_pig_tractors:plant/item/wheat_seeds

# place block
setblock ~ ~ ~ wheat destroy

# sound
playsound minecraft:block.grass.place block @a[distance=..9] ~ ~ ~ 0.6 0.6
