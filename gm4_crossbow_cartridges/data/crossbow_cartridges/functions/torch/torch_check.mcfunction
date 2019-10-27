# @s = @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}]
# at @s

#summon torch item if placing torch failed
execute unless block ~ ~ ~ #crossbow_cartridges:replaceable run summon item ~ ~ ~ {Item:{id:"minecraft:torch",Count:1b}}

#place torch if possible
execute if block ~ ~ ~ #crossbow_cartridges:replaceable run function crossbow_cartridges:torch/torch_place

#remove tag
tag @s remove gm4_cb_torch

#kill arrow
kill @s
