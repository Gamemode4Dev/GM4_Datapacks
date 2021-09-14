
schedule function gm4_chest_boats:main 16t

execute as @e[type=boat] at @s if entity @e[type=chest_minecart,distance=..2,predicate=!gm4_chest_boats:is_passenger] unless entity @p[distance=..0.5] unless data entity @s Passengers[0] run function gm4_chest_boats:merge
