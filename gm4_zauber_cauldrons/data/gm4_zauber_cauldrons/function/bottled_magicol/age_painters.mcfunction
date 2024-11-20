# Commands painters to paint at specific age values
# @s = @e[type=marker,tag=gm4_zc_magicol_painter]
# at @s
# run from bottled_magicol/maintain_magicol_painters

# time fillbiome
scoreboard players add @s gm4_zc_magicol_painter_timer 1
execute if score @s gm4_zc_magicol_painter_timer matches 1 run playsound minecraft:entity.illusioner.prepare_mirror block @a[distance=..16] ~ ~ ~ 0.2 0.5 0.5
execute if score @s gm4_zc_magicol_painter_timer matches 6 run function gm4_zauber_cauldrons:bottled_magicol/prepare_fillbiome
execute if score @s gm4_zc_magicol_painter_timer matches 13 run function gm4_zauber_cauldrons:bottled_magicol/prepare_fillbiome
execute if score @s gm4_zc_magicol_painter_timer matches 20 run function gm4_zauber_cauldrons:bottled_magicol/prepare_fillbiome
execute if score @s gm4_zc_magicol_painter_timer matches 20 run kill @s

# set flag
execute unless score @s gm4_zc_magicol_painter_timer matches 20.. run scoreboard players set $found_painter gm4_zc_data 1
