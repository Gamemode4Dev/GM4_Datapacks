# places a potato plant
# @s = player requesting potato planting
# at item planting location
# run from gm4_pig_tractors:plant/item/potato

# place block
setblock ~ ~ ~ potatoes destroy

# sound
playsound minecraft:block.grass.place block @a[distance=..9] ~ ~ ~ 0.6 0.6
