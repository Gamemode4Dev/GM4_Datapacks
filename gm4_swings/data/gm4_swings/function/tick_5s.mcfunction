# Handle persistent swing ticks, ran every 5 seconds
# @s = none
# at world spawn
# run from gm4_swings:init

schedule function gm4_swings:tick_5s 5s

execute as @e[type=minecraft:item_display,tag=gm4_swings.swing] at @s run function gm4_swings:swing/tick_5s
