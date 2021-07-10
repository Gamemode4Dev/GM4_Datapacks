# scheduled from chop and destroy_trunk

scoreboard players remove @e[type=marker,tag=gm4_arborenda_trunk] gm4_arb_depth 1
scoreboard players set success gm4_ml_data 0
execute store success score success gm4_ml_data as @e[type=marker,tag=gm4_arborenda_trunk,scores={gm4_arb_depth=..0}] at @s run function gm4_arborenda_shamir:destroy_block

execute if score success gm4_ml_data matches 1 run schedule function gm4_arborenda_shamir:destroy_trunk 2t
