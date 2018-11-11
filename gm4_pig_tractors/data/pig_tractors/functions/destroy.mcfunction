setblock ~ ~ ~ air destroy
tag @s add gm4_harvested
execute align xyz as @e[type=item,distance=..1,tag=!gm4_crop_tp] run function pig_tractors:teleport
tag @s remove gm4_harvested
