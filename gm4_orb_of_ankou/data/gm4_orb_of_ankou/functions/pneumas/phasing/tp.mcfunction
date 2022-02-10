# @s = sneaking player with phasing pneuma that has space to phase
# run from pneumas/phasing/check_traversable

scoreboard players reset @s gm4_oa_snk_num

playsound minecraft:entity.vex.ambient player @a[distance=..6] ~ ~ ~ 1 .7
execute at @s run particle minecraft:poof ~ ~ ~ 0 0 0 0 10
tp @s ~ ~ ~
particle minecraft:poof ~ ~ ~ 0 0 0 0 10
tag @s add gm4_oa_phased
