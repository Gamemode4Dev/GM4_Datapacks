# activate archer armor for this player
# @s = player with archer armor
# at unspecified
# run from clocks/player_process

scoreboard players reset @s gm4_ce_used_bow
scoreboard players reset @s gm4_ce_used_crossbow
tag @s add gm4_ce_wearing_archer

execute unless score $keep_tick.archer gm4_ce_keep_tick matches 1 run schedule function gm4_ce_base:clocks/temp/archer 1t
