# @s = glass block on the ground 
# run from main

tag @s add gm4_liquid_minecarts_checking_glass
execute as @e[type=hopper_minecart,tag=!gm4_machine,nbt={Items:[{id:"minecraft:hopper",Count:1b},{id:"minecraft:iron_trapdoor",Count:1b},{id:"minecraft:comparator",Count:1b},{id:"minecraft:dispenser",Count:1b},{id:"minecraft:bucket",Count:1b}]}] at @s run function gm4_liquid_minecarts:create
tag @s add gm4_liquid_minecarts_checked
tag @s remove gm4_liquid_minecarts_checking_glass