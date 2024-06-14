# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5
# @optional

setblock ~1 ~1 ~1 chest
item replace block ~1 ~1 ~1 container.5 with minecraft:apple 4

# pick up chest with relocator
loot give @s loot gm4_relocators:items/relocator_empty
execute at @s run tp @s ~ ~ ~ facing ~ ~-0.5 ~1
dummy @s sneak true

await delay 1s

dummy @s use block ~1 ~1 ~1 up

await block ~1 ~1 ~1 air
assert items entity @e[type=item,distance=..4] contents minecraft:player_head[custom_data~{gm4_machines:{id:"relocator_full"}}]

clear @s
tp @e[type=item,distance=..4,limit=1] @s

await items entity @s container.* minecraft:player_head[custom_data~{gm4_machines:{id:"relocator_full"}}]

# place down chest with relocator
execute at @s run tp @s ~ ~ ~ facing ~0.5 ~-0.8 ~1
dummy @s use block ~2 ~ ~2 up

await items block ~2 ~1 ~2 container.5 minecraft:apple[count=4]
