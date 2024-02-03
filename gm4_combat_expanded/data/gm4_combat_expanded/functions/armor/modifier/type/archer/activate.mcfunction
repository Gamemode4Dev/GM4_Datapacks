# actiavte archer armor for this player
# @s = player with archer armor
# at unspecified
# run from player/process

scoreboard players reset @s gm4_ce_used_bow
scoreboard players reset @s gm4_ce_used_crossbow
tag @s add gm4_ce_wearing_archer

schedule function gm4_combat_expanded:armor/modifier/type/archer/clock 1t
