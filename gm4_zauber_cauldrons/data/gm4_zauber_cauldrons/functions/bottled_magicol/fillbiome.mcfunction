# Fills the biome around a magicol painter
# @s = @e[type=marker,tag=gm4_zc_magicol_painter]
# at @s
# run from bottled_magicol/prepare_fillbiome

# change biome
$fillbiome ~-$(radius) ~-$(radius) ~-$(radius) ~$(radius) ~$(radius) ~$(radius) $(biome)

# sound effect & particles
playsound minecraft:block.chorus_flower.grow block @a[distance=..16] ~ ~ ~ 1 0.77
$particle minecraft:end_rod ~$(random_x_1) ~$(random_y_1) ~$(random_z_1) 0.2 0.2 0.2 0.1 32
$particle minecraft:end_rod ~$(random_x_2) ~$(random_y_2) ~$(random_z_2) 0.2 0.2 0.2 0.1 32

# grant advancement
advancement grant @a[distance=..12,gamemode=!spectator] only gm4:zauber_cauldrons_paint_biome
