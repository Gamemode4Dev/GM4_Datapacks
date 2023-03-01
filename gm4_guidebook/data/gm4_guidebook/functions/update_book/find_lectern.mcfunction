# finds the lectern holding the guidebook
# @s = player that triggered gm4_guide
# located at world spawn
# run from gm4_guidebook:tick

# raycast to lectern
scoreboard players set $ray gm4_count 50
scoreboard players set $found gm4_guide 0
execute at @s anchored eyes positioned ^ ^ ^ run function gm4_guidebook:update_book/ray

# clean up
scoreboard players reset $ray gm4_count
