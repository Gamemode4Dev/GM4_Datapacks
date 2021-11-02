# @s = player that has mined gravel while underwater
# located at position of flint item
# run from check_gravel

execute store result score $result gm4_st_random run loot spawn ~ ~ ~ fish gm4_sunken_treasure:gameplay/gravel_treasure ~ ~ ~ mainhand

execute as @e[type=item,limit=1,dx=0,nbt={Item:{tag:{gm4_sunken_treasure:{spawn:{}}}},Age:0s}] at @s run function gm4_sunken_treasure:spawn_entity

# kill flint if loot was spawned
execute if score $result gm4_st_random matches 1.. run kill @e[type=minecraft:item,limit=1,distance=0,nbt={Item:{id:"minecraft:flint"},Age:0s}]
scoreboard players reset $result gm4_st_random
