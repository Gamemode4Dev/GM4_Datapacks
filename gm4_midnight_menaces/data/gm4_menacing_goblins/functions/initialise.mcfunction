# @s = none
# at world spawn
# called by event. Only runs once per illusioner night.

# start slow clock
schedule function gm4_menacing_goblins:slow_clock 1t

# initialise is done
scoreboard players set menacing_goblins gm4_menace_data 1
