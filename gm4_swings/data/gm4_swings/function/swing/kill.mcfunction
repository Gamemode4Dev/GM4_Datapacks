# Kills a swing and its constituent parts, ran when a swing is broken by a player
# @s = Item display, swing main body
# at @s
# run from gm4_swings:break/main

# break interaction
execute on passengers run kill @s

# seat
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id
execute as @n[type=minecraft:item_display,tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match,distance=..20] run function gm4_swings:seat/kill

# display
kill @s
