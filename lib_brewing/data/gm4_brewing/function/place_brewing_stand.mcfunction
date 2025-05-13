# Initiates the search for the newly placed brewing stand
# @s = player that just placed a brewing stand
# at @s
# run from advancement place_brewing_stand

# revoke advancement
advancement revoke @s only gm4_brewing:place_brewing_stand

# find newly placed brewing stand and place marker
scoreboard players set $ray gm4_count 500
execute anchored eyes positioned ^ ^ ^ run function gm4_brewing:mark_brewing_stand

# reset fake players
scoreboard players reset $ray gm4_count
scoreboard players reset $found gm4_count
