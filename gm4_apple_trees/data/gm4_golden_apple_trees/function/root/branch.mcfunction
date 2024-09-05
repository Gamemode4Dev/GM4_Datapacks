# handles branching golden apple roots
# @s = gm4_golden_root_ray marker
# located at @s
# run from gm4_golden_apple_trees:root/raycast

summon marker ~ ~ ~ {Tags:["gm4_golden_apple_root_ray","gm4_golden_apple_root_branch","smithed.entity","smithed.strict"]}
execute if score @s gm4_ga_root_count matches 5 run tp @e[type=marker,tag=gm4_golden_apple_root_branch,limit=1] ~ ~ ~ ~160 ~
execute if score @s gm4_ga_root_count matches 8 run tp @e[type=marker,tag=gm4_golden_apple_root_branch,limit=1] ~ ~ ~ ~-130 ~
execute if score @s gm4_ga_root_count matches 11 run tp @e[type=marker,tag=gm4_golden_apple_root_branch,limit=1] ~ ~ ~ ~100 ~
scoreboard players set @e[type=marker,tag=gm4_golden_apple_root_branch,limit=1] gm4_ga_root_count 12

execute as @e[type=marker,tag=gm4_golden_apple_root_branch,limit=1] at @s run function gm4_golden_apple_trees:root/raycast
