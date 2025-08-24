# @template gm4_liquid_tanks:test_setup
# @dummy ~ ~1 ~

# create lava tank
item replace block ~1 ~3 ~1 container.0 with minecraft:lava_bucket
await not items block ~1 ~3 ~1 container.0 minecraft:lava_bucket

# place furnace
setblock ~2 ~3 ~1 furnace

# link furnace (dummy faces tank)
execute at @s run tp @s ~ ~ ~ -45 ~-45
await delay 1s
assert entity @e[tag=gm4_lt_util_block,type=area_effect_cloud] inside

# check furnace fueling
item replace block ~2 ~3 ~1 container.0 with minecraft:raw_iron
await delay 1s
assert block ~2 ~3 ~1 minecraft:furnace[lit=true]
assert score @n[tag=gm4_liquid_tank] gm4_lt_value matches 2

# check we don't duplicate fuel
setblock ~2 ~3 ~1 stone
setblock ~1 ~3 ~ blast_furnace
setblock ~1 ~3 ~2 furnace
setblock ~ ~3 ~1 furnace
await entity @e[tag=gm4_lt_util_block,type=area_effect_cloud,y_rotation=90] inside
item replace block ~1 ~3 ~ container.0 with minecraft:raw_iron
item replace block ~1 ~3 ~2 container.0 with minecraft:raw_iron
item replace block ~ ~3 ~1 container.0 with minecraft:raw_iron
await delay 1s

scoreboard objectives add gm4_test dummy
scoreboard players set $fueled gm4_test 0
execute if block ~1 ~3 ~ minecraft:blast_furnace[lit=true] run scoreboard players add $fueled gm4_test 1
execute if block ~1 ~3 ~2 minecraft:furnace[lit=true] run scoreboard players add $fueled gm4_test 1
execute if block ~ ~3 ~1 minecraft:furnace[lit=true] run scoreboard players add $fueled gm4_test 1

assert score $fueled gm4_test matches 2
assert score @n[tag=gm4_liquid_tank] gm4_lt_value matches 0
