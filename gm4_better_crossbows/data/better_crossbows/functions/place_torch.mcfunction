# @s = @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}]
# at @s

#place torch
execute if block ~ ~-.05 ~ #better_crossbows:torch_placeable run setblock ~ ~ ~ minecraft:torch
execute if block ~.05 ~ ~ #better_crossbows:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=west]
execute if block ~ ~ ~.05 #better_crossbows:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=north]
execute if block ~-.05 ~ ~ #better_crossbows:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=east]
execute if block ~ ~ ~-.05 #better_crossbows:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=south]

#clear torch
execute unless block ~ ~ ~ #better_crossbows:air run clear @p[tag=gm4_cb_torch] torch 1

#remove tag
tag @p[tag=gm4_cb_torch] remove gm4_cb_torch
tag @s remove gm4_cb_torch

#kill arrow
execute unless block ~ ~ ~ #better_crossbows:air run kill @s
