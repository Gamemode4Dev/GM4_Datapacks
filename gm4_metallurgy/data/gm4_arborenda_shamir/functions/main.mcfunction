# @s = player holding arborenda axe
# run from metallurgy:shamir_in_hand when a player is holding an arborenda axe

# look for players who have used an axe and have the arborenda shamir
execute as @a[scores={gm4_use_axe_net=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:chop
execute as @a[scores={gm4_use_axe_dia=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:chop
execute as @a[scores={gm4_use_axe_gol=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:chop
execute as @a[scores={gm4_use_axe_iro=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:chop
execute as @a[scores={gm4_use_axe_sto=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:chop
execute as @a[scores={gm4_use_axe_woo=1..},predicate=gm4_metallurgy:arborenda_active] at @s run function gm4_arborenda_shamir:chop
scoreboard players reset @a gm4_use_axe_net
scoreboard players reset @a gm4_use_axe_dia
scoreboard players reset @a gm4_use_axe_gol
scoreboard players reset @a gm4_use_axe_iro
scoreboard players reset @a gm4_use_axe_sto
scoreboard players reset @a gm4_use_axe_woo
