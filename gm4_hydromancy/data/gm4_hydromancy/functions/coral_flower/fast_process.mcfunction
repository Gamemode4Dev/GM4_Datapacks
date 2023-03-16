# process coral flowers (16t)
# @s = coral flower
# at @s
# run from main

particle nautilus ~ ~ ~ 0.15 0 0.15 0.1 4
particle bubble_column_up ~ ~-0.45 ~ 0.25 0 0.25 0.1 3
execute if predicate gm4_hydromancy:chance/extra_bubbles run particle bubble_column_up ~ ~-0.45 ~ 0.3 0.05 0.3 0.25 8

execute if predicate gm4_hydromancy:chance/bubble_sound run playsound minecraft:block.bubble_column.upwards_ambient block @a[distance=..12] ~ ~-.5 ~ 1 0
execute if predicate gm4_hydromancy:chance/bubble_pitched_sound run playsound minecraft:block.bubble_column.upwards_ambient block @a[distance=..12] ~ ~-.5 ~ 1 1.65

# TODO: respawn heart of the sea
execute unless block ~ ~ ~ #gm4_hydromancy:coral_fans run kill @s
