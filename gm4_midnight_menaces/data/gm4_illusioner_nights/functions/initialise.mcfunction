# @s = none
# at world spawn
# called by event. Only runs once per illusioner night.

# start slow clock
schedule function gm4_illusioner_nights:slow_clock 1t

# initialise is done
scoreboard players set illusioner_nights gm4_menace_data 1
