# Place redstone torch on a valid adjacent block
# @s = arrow with tag gm4_cb_rtorch, in a block
# at @s
# run from projectile/redstone_torch/check

execute positioned ~.1 ~ ~ if predicate gm4_crossbow_cartridges:check_block/east run setblock ~-.15 ~ ~ minecraft:redstone_wall_torch[facing=west]
execute positioned ~ ~ ~.1 if predicate gm4_crossbow_cartridges:check_block/south run setblock ~ ~ ~-.15 minecraft:redstone_wall_torch[facing=north]
execute positioned ~-.1 ~ ~ if predicate gm4_crossbow_cartridges:check_block/west run setblock ~.15 ~ ~ minecraft:redstone_wall_torch[facing=east]
execute positioned ~ ~ ~-.1 if predicate gm4_crossbow_cartridges:check_block/north run setblock ~ ~ ~.15 minecraft:redstone_wall_torch[facing=south]
execute positioned ~ ~-.1 ~ if predicate gm4_crossbow_cartridges:check_block/below run setblock ~ ~.15 ~ minecraft:redstone_torch

# place block sound
execute if block ~ ~ ~ #gm4_crossbow_cartridges:torch run scoreboard players set $torch_placed gm4_cb_misc 1
execute if score $torch_placed gm4_cb_misc matches 1 run playsound minecraft:block.wood.place block @a[distance=..15]
