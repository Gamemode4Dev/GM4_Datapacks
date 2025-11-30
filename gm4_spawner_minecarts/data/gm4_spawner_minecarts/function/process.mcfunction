# process spawner minecarts
# @s = spawner minecart
# at @s
# run from main

# check nearby spawner minecarts, each gives a +25% chance to not reduce delay
execute positioned ~-4.5 ~-4 ~-4.5 store result score $nearby_carts gm4_spawner_minecarts_data if entity @e[type=spawner_minecart,tag=gm4_spawner_minecart,dx=8,dy=7,dz=8]
scoreboard players remove $nearby_carts gm4_spawner_minecarts_data 1
execute unless predicate {condition:"random_chance",chance:{type:"score",score:"gm4_spawner_minecarts_data",target:{type:"fixed",name:"$nearby_carts"},scale:0.25}} run return fail

execute store result score $delay gm4_spawner_minecarts_data run data get entity @s Delay
execute store result entity @s Delay int 1 run scoreboard players add $delay gm4_spawner_minecarts_data 16
particle angry_villager ~ ~ ~ 0.4 0.4 0.4 0 1
