# @s = player with soaring pneuma
# run from main

execute if entity @s[x_rotation=-79.99..79.99] run function gm4_orb_of_ankou:pneumas/soaring/idle

execute if entity @s[x_rotation=-90..-80] run function gm4_orb_of_ankou:pneumas/soaring/ascend

execute if entity @s[x_rotation=80..90] run effect clear @s levitation

effect give @s slow_falling 3 0 true
tag @s add gm4_oa_soaring_off_ground
particle minecraft:firework ~ ~ ~ .15 -.2 .15 0 5
