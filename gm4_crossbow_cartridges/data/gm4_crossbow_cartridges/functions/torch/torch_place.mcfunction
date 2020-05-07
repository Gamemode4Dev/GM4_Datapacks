#run from torch/torch_check
# @s = @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}]
# at @s

#place torch
execute if block ~.05 ~ ~ #gm4_crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=west] destroy
execute if block ~ ~ ~.05 #gm4_crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=north] destroy
execute if block ~-.05 ~ ~ #gm4_crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=east] destroy
execute if block ~ ~ ~-.05 #gm4_crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=south] destroy
execute if block ~ ~-.05 ~ #gm4_crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:torch destroy
