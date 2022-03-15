
schedule function gm4_chest_boats:main 16t

execute as @e[type=boat,tag=!smithed.entity] at @s if entity @e[type=chest_minecart,tag=!smithed.entity,distance=..2,predicate=!gm4_chest_boats:is_passenger,limit=1] unless entity @a[limit=1,distance=..0.5] unless data entity @s Passengers[-1] run function gm4_chest_boats:merge
