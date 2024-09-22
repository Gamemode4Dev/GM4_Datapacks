# activate archer armor for this player
# @s = player with archer armor
# at unspecified
# run from player/process

scoreboard players reset @s gm4_aa_stat.used_bow
scoreboard players reset @s gm4_aa_stat.used_crossbow
tag @s add gm4_aa_wearing_archer

execute unless score $keep_tick.archer gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/archer 1t
