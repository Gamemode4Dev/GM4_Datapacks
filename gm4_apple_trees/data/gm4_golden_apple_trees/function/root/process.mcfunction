# handles operations on golden apple roots
# @s = gm4_golden_root marker
# located at @s
# run from gm4_apple_trees:main

scoreboard players add @s gm4_ga_root 1
execute if block ~ ~ ~ gold_ore if score @s gm4_ga_root >= #golden_root_time gm4_ga_root run function gm4_golden_apple_trees:root/grow

execute unless block ~ ~ ~ gold_ore run kill @s
