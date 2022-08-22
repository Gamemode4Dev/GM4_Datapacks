# advance spore growth
# @s = spore
# at @s
# run from main

execute if score @s gm4_ce_data matches 10.. run function gm4_combat_expanded:mob/effect/spores/activate
scoreboard players add @s gm4_ce_data 1
execute if score @s gm4_ce_data matches 1..4 run particle block flowering_azalea_leaves ~ ~ ~ 0.04 0.15 0.04 0.05 5
execute if score @s gm4_ce_data matches 5..7 run particle block flowering_azalea_leaves ~ ~ ~ 0.045 0.175 0.045 0.1 8
execute if score @s gm4_ce_data matches 8.. run particle block flowering_azalea_leaves ~ ~ ~ 0.05 0.2 0.05 0.15 16
playsound block.grass.step hostile @a ~ ~ ~ 2 0.5
