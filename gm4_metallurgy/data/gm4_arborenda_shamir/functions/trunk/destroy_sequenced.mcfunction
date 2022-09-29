# Destroys marked trunk block one by one according to their depth score (in sequence).
# @s = none
# at world spawn
# scheduled from gm4_arborenda_shamir:player/chop and self

scoreboard players remove @e[type=marker,tag=gm4_arborenda_trunk] gm4_arb_depth 1
scoreboard players set $success gm4_arb_data 0
execute store success score $success gm4_arb_data as @e[type=marker,tag=gm4_arborenda_trunk,scores={gm4_arb_depth=..0}] at @s run function gm4_arborenda_shamir:trunk/destroy_block

execute if score $success gm4_arb_data matches 1 run schedule function gm4_arborenda_shamir:trunk/destroy_sequenced 2t
