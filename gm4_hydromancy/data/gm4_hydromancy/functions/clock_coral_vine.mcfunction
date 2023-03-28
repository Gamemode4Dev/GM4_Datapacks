schedule function gm4_hydromancy:clock_coral_vine 60s

# grow the coral vine (33% chance)
execute as @e[type=item_display,tag=gm4_hy_coral_core,predicate=gm4_hydromancy:chance/vine_growth] at @s positioned ~-7.5 ~-1.5 ~-7.5 run function gm4_hydromancy:coral_vine/grow/initiate
