# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5
# @timeout 300
# @skyaccess

loot give @s loot gm4_smelteries:items/smeltery
dummy @s jump
await delay 5t
dummy @s use block ~1 ~ ~ up

await block ~1 ~1 ~ furnace

setblock ~1 ~1 ~1 cauldron
fill ~ ~1 ~ ~2 ~2 ~2 iron_block replace air
fill ~1 ~1 ~ ~1 ~2 ~1 air replace iron_block

await entity @e[tag=gm4_smeltery] inside

item replace block ~1 ~1 ~ container.0 with raw_iron
item replace block ~1 ~1 ~ container.1 with coal

await items block ~1 ~1 ~ container.2 minecraft:iron_ingot[count=2]
