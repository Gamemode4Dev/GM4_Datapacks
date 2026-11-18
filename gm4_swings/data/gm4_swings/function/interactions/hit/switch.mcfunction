# Switch for all the different kinds of interactions
# @s = Interaction, part of a swing 
# at @s
# run from gm4_swings:interactions/hit/on_interaction

execute if entity @s[tag=gm4_swings.interaction.break] on vehicle run return run function gm4_swings:break/main
execute if entity @s[tag=gm4_swings.interaction.seat] on vehicle run return run function gm4_swings:seat/push/main
