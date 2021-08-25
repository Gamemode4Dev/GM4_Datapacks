# @s = brewing stand that finished brewing
# run from check_brew

# mark as finished
tag @s remove gm4_brewing_tick
tag @s add gm4_brewing_finished

# store contents of brewing stand
data modify entity @s data.Items set from block ~ ~ ~ Items

# run the finish functions
schedule function gm4_brewing-1.0:finish_brew 1t
