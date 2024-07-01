# display a ring of fire particles
# @s = burn particle marker
# at @s
# run from armor/modifier/type/burn/active

scoreboard players add @s gm4_ce_data 1
particle flame ^ ^ ^-5 0.01 0.01 0.01 0.025 1
execute if score $full_burn gm4_ce_data matches 1 run particle flame ^ ^ ^-5 0.033 0.033 0.033 0.075 2
tp @s ~ ~ ~ ~9 ~

kill @s[scores={gm4_ce_data=40..}]
execute if score @s gm4_ce_data matches ..39 at @s run function gm4_combat_expanded:armor/modifier/type/burn/particles
