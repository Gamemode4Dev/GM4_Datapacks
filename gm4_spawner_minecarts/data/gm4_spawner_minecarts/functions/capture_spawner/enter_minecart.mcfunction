#@s = minecarts under spawners
#run from main

#call spawner lists, other modules can add lists here
function #gm4_spawner_minecarts:spawner_list
execute if score @s gm4_spawner_fuel matches 1.. as @e[tag=gm4_spawner_minecart,limit=1,distance=..1] run function gm4_spawner_minecarts:capture_spawner/finalize_enter_minecart
