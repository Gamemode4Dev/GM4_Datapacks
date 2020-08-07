#@s = water tank with one coloured wool in the first slot
#run from wash

data modify block ~ ~ ~ Items[0].id set value white_wool
scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
