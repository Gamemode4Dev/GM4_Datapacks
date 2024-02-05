# @template gm4_liquid_tanks:test_setup
# @dummy ~ ~1 ~

data merge block ~1 ~3 ~1 {Items:[{Slot:0b,id:"minecraft:experience_bottle",Count:10b}]}
execute at @s run tp @s ~1 ~1 ~1

await entity @s[level=6]

await score @e[tag=gm4_liquid_tank,distance=..5,limit=1] gm4_lt_value matches 0
