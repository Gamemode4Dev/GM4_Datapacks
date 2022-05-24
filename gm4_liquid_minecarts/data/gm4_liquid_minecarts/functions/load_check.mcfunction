#@s = liquid minecart
#run from main

#load
execute if block ~1 ~ ~ hopper[facing=west] align xyz positioned ~1.5 ~0.5 ~0.5 run function gm4_liquid_minecarts:try_to_load
execute if block ~-1 ~ ~ hopper[facing=east] align xyz positioned ~-0.5 ~0.5 ~0.5 run function gm4_liquid_minecarts:try_to_load
execute if block ~ ~ ~1 hopper[facing=north] align xyz positioned ~0.5 ~0.5 ~1.5 run function gm4_liquid_minecarts:try_to_load
execute if block ~ ~ ~-1 hopper[facing=south] align xyz positioned ~0.5 ~0.5 ~-0.5 run function gm4_liquid_minecarts:try_to_load
execute if block ~ ~1 ~ hopper[facing=down] positioned ~ ~1.5 ~ run function gm4_liquid_minecarts:try_to_load

#unload
execute if block ~ ~-1 ~ hopper positioned ~ ~-0.5 ~ run function gm4_liquid_minecarts:try_to_unload
