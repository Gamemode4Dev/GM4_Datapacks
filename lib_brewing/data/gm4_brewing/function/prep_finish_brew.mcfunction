# @s = brewing stand that finished brewing
# run from check_brew

# mark as finished
tag @s remove gm4_brewing_tick
tag @s add gm4_brewing_finished
scoreboard players set $brewed gm4_brewing_data 1

# store contents of brewing stand
data modify entity @s data.gm4_brewing.previous_items set from block ~ ~ ~ Items

# run the finish functions
schedule function gm4_brewing:finish_brew 1t
