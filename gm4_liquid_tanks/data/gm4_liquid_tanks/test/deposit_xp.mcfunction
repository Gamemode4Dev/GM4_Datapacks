# @template gm4_liquid_tanks:test_setup
# @dummy ~ ~1 ~

xp add @s 100
execute at @s run tp @s ~1 ~4 ~1

await entity @s[level=0]

# there is a slight loss of xp points
assert score @e[tag=gm4_liquid_tank,distance=..5,limit=1] gm4_lt_value matches 80..100
