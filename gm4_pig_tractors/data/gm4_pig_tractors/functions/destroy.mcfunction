# @s = valid pig tractor replacing crops
# at @s
# Called from repl_crops folder
setblock ~ ~ ~ air destroy
tag @s add gm4_harvested
execute align xyz positioned ~.5 ~.5 ~.5 as @e[type=item,distance=..1.3,tag=!gm4_crop_tp] run function pig_tractors:teleport
tag @s remove gm4_harvested
