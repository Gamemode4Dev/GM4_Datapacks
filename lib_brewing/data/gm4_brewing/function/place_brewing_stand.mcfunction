# Initiates the search for the newly placed brewing stand
# @s = player that just placed a brewing stand
# at @s
# run from advancement place_brewing_stand

# revoke advancement
advancement revoke @s only gm4_brewing:place_brewing_stand

# find newly placed brewing stand and place marker
# check blocks on looking vector
scoreboard players set $ray gm4_count 500
execute store success score $found_brewing_stand gm4_count anchored eyes positioned ^ ^ ^ run function gm4_brewing:mark_brewing_stand

# check adjacent blocks
execute unless score $found_brewing_stand gm4_count matches 1 run function gm4_brewing:mark_adjacent_brewing_stand
scoreboard players reset $found_brewing_stand gm4_count

# reset fake players
scoreboard players reset $ray gm4_count
scoreboard players reset $found gm4_count
