# Place torch on a valid adjacent block
# @s = arrow with tag gm4_cb_torch, in a block
# at @s
# run from projectile/torch/check

execute positioned ~.1 ~ ~ if predicate gm4_crossbow_cartridges:check_block/east run setblock ~-.15 ~ ~ minecraft:wall_torch[facing=west]
execute positioned ~ ~ ~.1 if predicate gm4_crossbow_cartridges:check_block/south run setblock ~ ~ ~-.15 minecraft:wall_torch[facing=north]
execute positioned ~-.1 ~ ~ if predicate gm4_crossbow_cartridges:check_block/west run setblock ~.15 ~ ~ minecraft:wall_torch[facing=east]
execute positioned ~ ~ ~-.1 if predicate gm4_crossbow_cartridges:check_block/north run setblock ~ ~ ~.15 minecraft:wall_torch[facing=south]
execute positioned ~ ~-.1 ~ if predicate gm4_crossbow_cartridges:check_block/below run setblock ~ ~.15 ~ minecraft:torch
