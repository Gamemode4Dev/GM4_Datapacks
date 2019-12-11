#@s = player that has just broken a leaf
#run from pulse_check

scoreboard players reset @s gm4_leaf_broken

execute as @e[type=item,distance=..5,nbt={Age:0s,PickupDelay:10s,Item:{id:"minecraft:stick"}}] at @s run function gm4_ambrosia:larvae/create_larvae
