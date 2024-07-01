# @s = player that has mined gravel while underwater
# located at @s
# run from tick

execute at @e[type=minecraft:item,limit=1,distance=..2.5,predicate=gm4_sunken_treasure:is_gravel_item,nbt={Age:0s}] run function gm4_sunken_treasure:treasure_gravel
execute at @e[type=minecraft:item,limit=1,distance=..2.5,predicate=gm4_sunken_treasure:is_flint_item,nbt={Age:0s}] run function gm4_sunken_treasure:treasure_flint
