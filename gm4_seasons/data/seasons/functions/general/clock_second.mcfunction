#run from seasons:general/clock_tick


function seasons:general/change
function seasons:blocks/global
function seasons:weather/cycle

execute if score gm4_szn_detect gm4_szn_season matches 1 run function seasons:spring/animals
execute if score gm4_szn_detect gm4_szn_season matches 2 run function seasons:summer/thirst
execute if score gm4_szn_detect gm4_szn_season matches 2 run function seasons:summer/zombie_check
execute if score gm4_szn_detect gm4_szn_season matches 4 run function seasons:winter/freeze
execute if score gm4_szn_detect gm4_szn_season matches 4 run function seasons:winter/skeleton_check

execute if entity @a[scores={gm4_szn_death=1..}] run function seasons:general/death



#CHECK OCEAN
execute if entity @a[tag=gm4_szn_check_biome] as @a[tag=gm4_szn_check_biome] run function seasons:general/biome_check/reset

execute if entity @a[scores={gm4_szn_timer=1..}] run function seasons:general/biome_check/remove