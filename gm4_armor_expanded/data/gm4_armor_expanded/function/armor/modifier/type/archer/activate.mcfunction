# activate archer armor for this player
# @s = player with archer armor
# at unspecified
# run from player/process

scoreboard players reset @s gm4_ae_used_bow
scoreboard players reset @s gm4_ae_used_crossbow
tag @s add gm4_ae_wearing_archer

execute unless score $keep_tick.archer gm4_ae_keep_tick matches 1 run schedule function gm4_armor_expanded:clocks/temp/archer 1t
