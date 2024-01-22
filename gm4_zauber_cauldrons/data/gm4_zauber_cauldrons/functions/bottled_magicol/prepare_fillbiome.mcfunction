# Loads data from the marker to initiate the fillbiome command
# @s = @e[type=marker,tag=gm4_zc_magicol_painter]
# at @s
# run from bottled_magicol/age_painters

# load biome name into storage
data modify storage gm4_zauber_cauldrons:temp/bottled_magicol/painter biome set from entity @s data.gm4_zauber_cauldrons.biome
data modify storage gm4_zauber_cauldrons:temp/bottled_magicol/painter flower set from entity @s data.gm4_zauber_cauldrons.flower
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter radius int 0.25 run scoreboard players get @s gm4_zc_magicol_painter_timer
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter random_x_1 int 1 run random value -3..3 gm4_zauber_cauldrons:bottled_magicol/particle_coordinates
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter random_y_1 int 1 run random value 0..3 gm4_zauber_cauldrons:bottled_magicol/particle_coordinates
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter random_z_1 int 1 run random value -3..3 gm4_zauber_cauldrons:bottled_magicol/particle_coordinates
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter random_x_2 int 1 run random value -5..5 gm4_zauber_cauldrons:bottled_magicol/particle_coordinates
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter random_y_2 int 1 run random value 0..5 gm4_zauber_cauldrons:bottled_magicol/particle_coordinates
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter random_z_2 int 1 run random value -5..5 gm4_zauber_cauldrons:bottled_magicol/particle_coordinates


# fillbiome
function gm4_zauber_cauldrons:bottled_magicol/fillbiome with storage gm4_zauber_cauldrons:temp/bottled_magicol/painter

# reset storage
data remove storage gm4_zauber_cauldrons:temp/bottled_magicol/painter biome
data remove storage gm4_zauber_cauldrons:temp/bottled_magicol/painter flower
data remove storage gm4_zauber_cauldrons:temp/bottled_magicol/painter radius
