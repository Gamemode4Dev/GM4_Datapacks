#run from redstone_torch/check
# @s = @e[type=minecraft:arrow,tag=gm4_cb_rtorch,nbt={inGround:1b}]
# at @s

#place torch
execute positioned ~.05 ~ ~ if predicate gm4_crossbow_cartridges:check_block_x run setblock ~-.1 ~ ~ minecraft:redstone_wall_torch[facing=west]
execute positioned ~ ~ ~.05 if predicate gm4_crossbow_cartridges:check_block_z run setblock ~ ~ ~-.1 minecraft:redstone_wall_torch[facing=north]
execute positioned ~-.05 ~ ~ if predicate gm4_crossbow_cartridges:check_block_x- run setblock ~.1 ~ ~ minecraft:redstone_wall_torch[facing=east]
execute positioned ~ ~ ~-.05 if predicate gm4_crossbow_cartridges:check_block_z- run setblock ~ ~ ~.1 minecraft:redstone_wall_torch[facing=south]
execute positioned ~ ~-.05 ~ if predicate gm4_crossbow_cartridges:check_block_y run setblock ~ ~.1 ~ minecraft:redstone_torch
