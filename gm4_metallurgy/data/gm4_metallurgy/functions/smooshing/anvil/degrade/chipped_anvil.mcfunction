# checks the facing of the chipped_anvil and degrades it
# @s = varies; an item used in the smooshing process
# at align xyz in anvil
# run from gm4_metallurgy:smooshing/anvil/degrade

execute if block ~ ~ ~ chipped_anvil[facing=north] run setblock ~ ~ ~ damaged_anvil[facing=north]
execute if block ~ ~ ~ chipped_anvil[facing=south] run setblock ~ ~ ~ damaged_anvil[facing=south]
execute if block ~ ~ ~ chipped_anvil[facing=east] run setblock ~ ~ ~ damaged_anvil[facing=east]
execute if block ~ ~ ~ chipped_anvil[facing=west] run setblock ~ ~ ~ damaged_anvil[facing=west]
