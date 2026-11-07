# Test the interaction and figure out what kind it is
# @s = Interaction, part of a swing 
# at @s
# run from gm4_swings:interactions/hit/main

execute on target unless entity @s[tag=gm4_swings.attacker] run return fail

# switch
execute if entity @s[tag=gm4_swings.interaction.break] on vehicle run function gm4_swings:break/main
execute if entity @s[tag=gm4_swings.interaction.seat] on vehicle run function gm4_swings:seat/push/main

data remove entity @s attack
