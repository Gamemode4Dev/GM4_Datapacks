# handles checking golden apple roots
# @s = gm4_golden_root_ray marker
# located at @s
# run from gm4_golden_apple_trees:root/grow

tag @s remove gm4_golden_apple_root_branch
tp @s ^ ^-1 ^0.6
execute if score @s gm4_ga_root_count matches 5 run function gm4_golden_apple_trees:root/branch
execute if score @s gm4_ga_root_count matches 8 run function gm4_golden_apple_trees:root/branch
execute if score @s gm4_ga_root_count matches 11 run function gm4_golden_apple_trees:root/branch
scoreboard players add @s gm4_ga_root_count 1
execute unless score @s gm4_ga_root_count matches 16.. at @s if block ~ ~ ~ gold_ore run function gm4_golden_apple_trees:root/raycast
