# Gives skiing effects to players wearing skis
# @s = player wearing skis
# at @s
# run from main

execute if block ~ ~-0.9 ~ minecraft:snow run effect give @s[predicate=gm4_skis:wearing_skis] speed 3 1 true