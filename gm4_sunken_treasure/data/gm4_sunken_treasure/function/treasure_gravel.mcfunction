# @s = player that has mined gravel while underwater
# located at position of gravel item
# run from check_gravel

execute store result score $result gm4_st_random run loot spawn ~ ~ ~ fish gm4_sunken_treasure:gameplay/gravel_treasure ~ ~ ~ mainhand

execute as @e[type=item,limit=1,dx=0,predicate=gm4_sunken_treasure:is_spawn_entity_item,nbt={Age:0s}] at @s run function gm4_sunken_treasure:spawn_entity

# kill gravel if loot was spawned
execute if score $result gm4_st_random matches 1.. run kill @e[type=minecraft:item,limit=1,distance=0,predicate=gm4_sunken_treasure:is_gravel_item,nbt={Age:0s}]
scoreboard players reset $result gm4_st_random
