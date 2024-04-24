# @template gm4_liquid_tanks:test_setup
# @dummy ~ ~1 ~

item replace block ~1 ~3 ~1 container.0 with minecraft:experience_bottle 10
execute at @s run tp @s ~1 ~1 ~1

await entity @s[level=6]

await score @e[tag=gm4_liquid_tank,distance=..5,limit=1] gm4_lt_value matches 0
