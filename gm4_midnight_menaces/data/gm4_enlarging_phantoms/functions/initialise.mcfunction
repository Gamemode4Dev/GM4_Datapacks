# @s = none
# at world spawn
# called by event. Only runs once per enlarging phantom night.

# start slow clock
schedule function gm4_enlarging_phantoms:slow_clock 1t

# initialise is done
scoreboard players set enlarging_phantoms gm4_menace_data 1
