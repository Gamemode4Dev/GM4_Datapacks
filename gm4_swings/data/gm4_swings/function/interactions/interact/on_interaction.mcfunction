# Test the interaction and figure out what kind it is
# @s = Interaction, part of a swing 
# at @s
# run from gm4_swings:interactions/interact/main

execute store result score $timestamp gm4_swings.dummy run data get entity @s interaction.timestamp
execute unless score $timestamp gm4_swings.dummy = $gametime gm4_swings.dummy run return run data remove entity @s interaction

# switch
function gm4_swings:interactions/interact/switch

data remove entity @s interaction
