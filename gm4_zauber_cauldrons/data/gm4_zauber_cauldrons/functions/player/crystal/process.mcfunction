# @s =  player with crystal in off-hand
# at world spawn
# run from player/submain

# activite freshly equiped crystals
execute unless score @s gm4_zc_crystal matches 0..7 at @s run function gm4_zauber_cauldrons:player/crystal/activate

# read and apply effects on slow clock
execute if score @s gm4_zc_crystal matches 0..7 run scoreboard players add @s gm4_zc_crystal 1
execute if score @s gm4_zc_crystal matches 8.. run function gm4_zauber_cauldrons:player/crystal/read_effect

# set fake player flag
scoreboard players set $success gm4_zc_data 1
