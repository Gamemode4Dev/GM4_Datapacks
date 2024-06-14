# raycast to find the dropper
# @s = marker ray
# located ^ ^ ^0.X, X = number of iterations
# run from gm4_custom_crafters:machine/craft_in_place/player_used_item

# check blocks around the marker ray
scoreboard players set $found gm4_count 0
execute store success score $found gm4_count if block ~ ~ ~ dropper align xyz positioned ~0.5 ~0.5 ~0.5 unless entity @e[type=marker,tag=gm4_machine_marker,distance=..0.1] run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}

# move forward
scoreboard players add $ray gm4_count 1
execute if score $ray gm4_count matches 0..50 unless score $found gm4_count matches 1 positioned ^ ^ ^0.1 run function gm4_custom_crafters:machine/craft_in_place/ray
