# manages the ender bolt infection on infected entities
# @s = entitiy infected with ender bolt
# at @s
# run from gm4_metallurgy:main

# manage infection
scoreboard players remove @s gm4_bolt_time 1
execute if score @s gm4_bolt_time matches -40 run function gm4_ender_bolt_shamir:infection/end

# ender bolt effects
particle portal ~ ~ ~ .1 .5 .1 .8 10
execute if score @s gm4_bolt_time matches 1.. run function gm4_ender_bolt_shamir:infection/symptoms
