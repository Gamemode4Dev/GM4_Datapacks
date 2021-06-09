#run from projectile/soul_torch/check
# @s = @e[type=minecraft:arrow,tag=gm4_cb_storch,nbt={inGround:1b}]

#place torch
execute positioned ~.05 ~ ~ if predicate gm4_crossbow_cartridges:check_block/east run setblock ~-.1 ~ ~ minecraft:soul_wall_torch[facing=west]
execute positioned ~ ~ ~.05 if predicate gm4_crossbow_cartridges:check_block/south run setblock ~ ~ ~-.1 minecraft:soul_wall_torch[facing=north]
execute positioned ~-.05 ~ ~ if predicate gm4_crossbow_cartridges:check_block/west run setblock ~.1 ~ ~ minecraft:soul_wall_torch[facing=east]
execute positioned ~ ~ ~-.05 if predicate gm4_crossbow_cartridges:check_block/north run setblock ~ ~ ~.1 minecraft:soul_wall_torch[facing=south]
execute positioned ~ ~-.05 ~ if predicate gm4_crossbow_cartridges:check_block/below run setblock ~ ~.1 ~ minecraft:soul_torch
