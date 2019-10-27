# @s = @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}]
# at @s

#place torch
execute if block ~.05 ~ ~ #crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=west]
execute if block ~ ~ ~.05 #crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=north]
execute if block ~-.05 ~ ~ #crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=east]
execute if block ~ ~ ~-.05 #crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:wall_torch[facing=south]
execute if block ~ ~-.05 ~ #crossbow_cartridges:torch_placeable run setblock ~ ~ ~ minecraft:torch
