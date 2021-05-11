
schedule function gm4_boat_chests:main 2s

execute as @e[type=boat,tag=!gm4_bc_boat] at @s if entity @e[type=chest_minecart,distance=..2,predicate=!gm4_boat_chests:is_passenger,limit=1] unless data entity @s Passengers[0] run function gm4_boat_chests:merge
