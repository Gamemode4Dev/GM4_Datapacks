# @s = none
# at world spawn
# called by midnight menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute unless score enlarging_phantoms gm4_menace_data matches 1 run function gm4_enlarging_phantoms:initialise
