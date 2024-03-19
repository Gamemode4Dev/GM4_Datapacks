# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5
# @optional

setblock ~1 ~1 ~1 chest{Items:[{Slot:5b,id:"minecraft:apple",Count:4b}]}

# pick up chest with relocator
loot give @s loot gm4_relocators:items/relocator_empty
execute at @s run tp @s ~ ~ ~ facing ~ ~-0.5 ~1
dummy @s sneak true

await delay 1s

dummy @s use block ~1 ~1 ~1 up

await block ~1 ~1 ~1 air
assert entity @e[type=item,distance=..4,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_machines:{id:"relocator_full"}}}}]

clear @s
tp @e[type=item,distance=..4,limit=1] @s

await entity @s[nbt={Inventory:[{id:"minecraft:player_head",Count:1b,tag:{gm4_machines:{id:"relocator_full"}}}]}]

# place down chest with relocator
execute at @s run tp @s ~ ~ ~ facing ~0.5 ~-0.8 ~1
dummy @s use block ~2 ~ ~2 up

await block ~2 ~1 ~2 chest{Items:[{Slot:5b,id:"minecraft:apple",Count:4b}]}
