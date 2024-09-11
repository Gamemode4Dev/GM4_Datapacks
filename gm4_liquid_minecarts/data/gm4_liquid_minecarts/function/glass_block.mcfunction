# @s = glass block on the ground 
# run from main

tag @s add gm4_liquid_minecarts_checking_glass
execute as @e[type=hopper_minecart,tag=!gm4_machine,nbt={Items:[{id:"minecraft:hopper",count:1},{id:"minecraft:iron_trapdoor",count:1},{id:"minecraft:comparator",count:1},{id:"minecraft:dispenser",count:1},{id:"minecraft:bucket",count:1}]}] at @s run function gm4_liquid_minecarts:create
tag @s add gm4_liquid_minecarts_checked
tag @s remove gm4_liquid_minecarts_checking_glass
