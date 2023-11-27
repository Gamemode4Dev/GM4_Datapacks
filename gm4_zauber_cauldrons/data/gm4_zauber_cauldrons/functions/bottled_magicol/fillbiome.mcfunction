# Fills the biome around a magicol painter
# @s = @e[type=marker,tag=gm4_zc_magicol_painter]
# at @s
# run from bottled_magicol/prepare_fillbiome

# change biome
$fillbiome ~-$(radius) ~-$(radius) ~-$(radius) ~$(radius) ~$(radius) ~$(radius) $(biome)

# sound effect
playsound minecraft:block.chorus_flower.grow block @a[distance=..16] ~ ~ ~ 1 0.77
