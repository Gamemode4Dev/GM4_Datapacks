# Checks whether the player has used an arborenda axe.
# @s = all players
# at world spawn
# run from gm4_metallurgy:tick

execute if entity @s[scores={gm4_use_axe_net=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:player/chop
execute if entity @s[scores={gm4_use_axe_dia=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:player/chop
execute if entity @s[scores={gm4_use_axe_gol=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:player/chop
execute if entity @s[scores={gm4_use_axe_iro=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:player/chop
execute if entity @s[scores={gm4_use_axe_sto=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:player/chop
execute if entity @s[scores={gm4_use_axe_woo=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:player/chop
scoreboard players reset @s gm4_use_axe_net
scoreboard players reset @s gm4_use_axe_dia
scoreboard players reset @s gm4_use_axe_gol
scoreboard players reset @s gm4_use_axe_iro
scoreboard players reset @s gm4_use_axe_sto
scoreboard players reset @s gm4_use_axe_woo
