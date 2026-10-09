execute on target unless entity @s[tag=gm4_swings.interacter] run return fail

# switch
execute if entity @s[tag=gm4_swings.interaction.seat] on vehicle run function gm4_swings:seat/sit

data remove entity @s interaction
