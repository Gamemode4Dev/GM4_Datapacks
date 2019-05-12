#run from main
#@s = liquid minecart

#load
execute if block ~1 ~ ~ hopper[facing=west] positioned ~1 ~ ~ run function liquid_minecarts:try_to_load
execute if block ~-1 ~ ~ hopper[facing=east] positioned ~-1 ~ ~ run function liquid_minecarts:try_to_load
execute if block ~ ~ ~1 hopper[facing=north] positioned ~-1 ~ ~ run function liquid_minecarts:try_to_load
execute if block ~ ~ ~-1 hopper[facing=south] positioned ~-1 ~ ~ run function liquid_minecarts:try_to_load
execute if block ~ ~1 ~ hopper[facing=down] positioned ~ ~1 ~ run function liquid_minecarts:try_to_load

#unload
execute if block ~ ~-1 ~ hopper positioned ~ ~-1 ~ run function liquid_minecarts:try_to_unload
