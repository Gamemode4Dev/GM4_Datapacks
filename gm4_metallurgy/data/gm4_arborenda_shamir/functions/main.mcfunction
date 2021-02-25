#@s = player holding arborenda axe
#run at 20hz from metallurgy:pulse_check when any player is holding an arborenda axe

#look for players who have used an axe and have the arborenda shamir
execute if score @s gm4_use_axe_net matches 1.. if entity @s[predicate=gm4_metallurgy:arborenda_active] run function gm4_arborenda_shamir:chop
execute if score @s gm4_use_axe_dia matches 1.. if entity @s[predicate=gm4_metallurgy:arborenda_active] run function gm4_arborenda_shamir:chop
execute if score @s gm4_use_axe_gol matches 1.. if entity @s[predicate=gm4_metallurgy:arborenda_active] run function gm4_arborenda_shamir:chop
execute if score @s gm4_use_axe_iro matches 1.. if entity @s[predicate=gm4_metallurgy:arborenda_active] run function gm4_arborenda_shamir:chop
execute if score @s gm4_use_axe_sto matches 1.. if entity @s[predicate=gm4_metallurgy:arborenda_active] run function gm4_arborenda_shamir:chop
execute if score @s gm4_use_axe_woo matches 1.. if entity @s[predicate=gm4_metallurgy:arborenda_active] run function gm4_arborenda_shamir:chop
scoreboard players reset @s gm4_use_axe_net
scoreboard players reset @s gm4_use_axe_dia
scoreboard players reset @s gm4_use_axe_gol
scoreboard players reset @s gm4_use_axe_iro
scoreboard players reset @s gm4_use_axe_sto
scoreboard players reset @s gm4_use_axe_woo
