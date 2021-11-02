# @s = player that has mined gravel while underwater
# located at @s
# run from tick

execute at @e[type=minecraft:item,limit=1,distance=..2.5,nbt={Item:{id:"minecraft:gravel"},Age:0s}] run function gm4_sunken_treasure:treasure_gravel
execute at @e[type=minecraft:item,limit=1,distance=..2.5,nbt={Item:{id:"minecraft:flint"},Age:0s}] run function gm4_sunken_treasure:treasure_flint
