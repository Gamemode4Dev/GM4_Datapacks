
tag @s add gm4_furniture_target
execute as @e[type=interaction,tag=gm4_furniture.sittable,distance=..8] if data entity @s interaction at @s positioned ~-0.4999 ~0.0001 ~-0.4999 run function gm4_furniture:interact/sit/process
tag @s remove gm4_furniture_target
