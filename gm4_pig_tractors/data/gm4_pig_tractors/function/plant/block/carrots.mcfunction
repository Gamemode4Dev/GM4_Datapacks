# places a carrot plant
# @s = player requesting carrot planting
# at item planting location
# run from gm4_pig_tractors:plant/item/carrot

# place block
setblock ~ ~ ~ carrots destroy

# sound
playsound minecraft:block.grass.place block @a[distance=..9] ~ ~ ~ 0.6 0.6
