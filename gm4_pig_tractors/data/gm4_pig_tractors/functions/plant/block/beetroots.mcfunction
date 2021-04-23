# places a beetroot plant
# @s = player requesting beetroot planting
# at item planting location
# run from gm4_pig_tractors:plant/item/beetroot_seeds

# place block
setblock ~ ~ ~ beetroots destroy

# sound
playsound minecraft:block.grass.place block @a[distance=..9] ~ ~ ~ 0.6 0.6
