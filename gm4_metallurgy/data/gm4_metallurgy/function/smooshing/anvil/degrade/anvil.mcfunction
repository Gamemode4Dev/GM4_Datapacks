# checks the facing of the anvil and degrades it
# @s = varies; an item used in the smooshing process
# at align xyz in anvil
# run from gm4_metallurgy:smooshing/anvil/degrade

execute if block ~ ~ ~ anvil[facing=north] run setblock ~ ~ ~ chipped_anvil[facing=north]
execute if block ~ ~ ~ anvil[facing=south] run setblock ~ ~ ~ chipped_anvil[facing=south]
execute if block ~ ~ ~ anvil[facing=east] run setblock ~ ~ ~ chipped_anvil[facing=east]
execute if block ~ ~ ~ anvil[facing=west] run setblock ~ ~ ~ chipped_anvil[facing=west]
