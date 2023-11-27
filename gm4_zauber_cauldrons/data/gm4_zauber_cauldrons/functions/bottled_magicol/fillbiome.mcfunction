# Fills the biome around a magicol painter
# @s = @e[type=marker,tag=gm4_zc_magicol_painter]
# at @s
# run from bottled_magicol/prepare_fillbiome

# change biome
$fillbiome ~-$(radius) ~-$(radius) ~-$(radius) ~$(radius) ~$(radius) ~$(radius) $(biome)

# sound effect
playsound minecraft:block.chorus_flower.grow block @a[distance=..16] ~ ~ ~ 1 0.77

# grant advancement
advancement grant @a[distance=..12,gamemode=!spectator] only gm4:zauber_cauldrons_paint_biome
