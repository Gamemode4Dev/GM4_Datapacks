#@s = water tank with one coloured carpet in the first slot
#run from wash

data modify block ~ ~ ~ Items[0].id set value white_carpet
scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
