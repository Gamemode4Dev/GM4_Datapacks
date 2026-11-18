# Switch for all the different kinds of interactions
# @s = Interaction, part of a swing 
# at @s
# run from gm4_swings:interactions/interact/on_interaction

execute if entity @s[tag=gm4_swings.interaction.seat] on vehicle run return run function gm4_swings:seat/sit/main
execute if entity @s[tag=gm4_swings.interaction.break] if score $is_sneaking gm4_swings.dummy matches 0 on vehicle run return run function gm4_swings:swing/shorten
execute if entity @s[tag=gm4_swings.interaction.break] if score $is_sneaking gm4_swings.dummy matches 1 on vehicle run return run function gm4_swings:swing/extend
