#@s = water tank with one coloured glazed terracotta in the first slot
#run from wash

data modify block ~ ~ ~ Items[0].id set value white_glazed_terracotta
scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
