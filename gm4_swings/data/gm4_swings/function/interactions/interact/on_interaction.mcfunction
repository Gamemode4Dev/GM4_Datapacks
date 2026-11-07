# Test the interaction and figure out what kind it is
# @s = Interaction, part of a swing 
# at @s
# run from gm4_swings:interactions/interact/main

execute on target unless entity @s[tag=gm4_swings.interacter] run return fail

# switch
execute if entity @s[tag=gm4_swings.interaction.seat] on vehicle run function gm4_swings:seat/sit

data remove entity @s interaction
