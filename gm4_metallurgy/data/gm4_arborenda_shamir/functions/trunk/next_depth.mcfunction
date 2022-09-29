# Recurses over connected trunk blocks to summon a marker at each.
# @s = player that just used an axe with arborenda
# at @s
# run from gm4_arborenda:player/chop and self

execute as @e[type=marker,tag=gm4_arborenda_init] at @s run function gm4_arborenda_shamir:trunk/neighbors/mark

# finish the new trunk markers
execute store result score @e[type=marker,tag=gm4_arborenda_init] gm4_arb_depth run scoreboard players operation $current_depth gm4_arb_data += $axe_delay gm4_arb_data
execute if score $current_depth gm4_arb_data <= $max_depth gm4_arb_data if score $chop_count gm4_arb_data matches ..256 if entity @e[type=marker,tag=gm4_arborenda_init] run function gm4_arborenda_shamir:trunk/next_depth
