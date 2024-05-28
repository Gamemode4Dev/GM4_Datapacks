# @s = player that has mined sand while underwater
# located at position of sand item
# run from tick

execute store result score $result gm4_st_random run loot spawn ~ ~ ~ fish gm4_sunken_treasure:gameplay/sand_treasure ~ ~ ~ mainhand

execute as @e[type=item,limit=1,dx=0,predicate=gm4_sunken_treasure:is_spawn_entity_item,nbt={Age:0s}] at @s run function gm4_sunken_treasure:spawn_entity

# kill sand if loot was spawned
execute if score $result gm4_st_random matches 1.. run kill @e[type=minecraft:item,limit=1,distance=0,predicate=gm4_sunken_treasure:is_sand_item,nbt={Age:0s}]
scoreboard players reset $result gm4_st_random
