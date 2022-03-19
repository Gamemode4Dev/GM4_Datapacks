# run from main
# @s = spore
# at @s

execute if score @s gm4_ce_data matches 20.. run function gm4_combat_evolved:mobs/effects/spores/activate
scoreboard players add @s gm4_ce_data 1
particle block flowering_azalea_leaves ~ ~ ~ 0.2 0.2 0.2 0.1 12
playsound block.grass.step hostile @a ~ ~ ~ 2 0.5
