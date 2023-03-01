# raycasts to the lectern
# @s = marker ray used to detect the lectern
# located anchored eyes ^ ^ ^0.X
# run from gm4_guidebook:update_book/find_lectern

execute if block ~ ~ ~ lectern[has_book=true]{Book:{tag:{gm4_guidebook:1b}}} align xyz positioned ~0.5 ~0.5 ~0.5 run function gm4_guidebook:update_book/update_lectern
scoreboard players remove $ray gm4_count 1
execute if score $found gm4_guide matches 0 if score $ray gm4_count matches 1.. positioned ^ ^ ^0.1 run function gm4_guidebook:update_book/ray
