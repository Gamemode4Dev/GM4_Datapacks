# Loads data from the marker to initiate the fillbiome command
# @s = @e[type=marker,tag=gm4_zc_magicol_painter]
# at @s
# run from bottled_magicol/age_painters

# load biome name into storage
data modify storage gm4_zauber_cauldrons:temp/bottled_magicol/painter biome set from entity @s data.gm4_zauber_cauldrons.biome
execute store result storage gm4_zauber_cauldrons:temp/bottled_magicol/painter radius int 0.25 run scoreboard players get @s gm4_zc_magicol_painter_timer

# fillbiome
function gm4_zauber_cauldrons:bottled_magicol/fillbiome with storage gm4_zauber_cauldrons:temp/bottled_magicol/painter

# reset storage
data remove storage gm4_zauber_cauldrons:temp/bottled_magicol/painter biome
data remove storage gm4_zauber_cauldrons:temp/bottled_magicol/painter radius
