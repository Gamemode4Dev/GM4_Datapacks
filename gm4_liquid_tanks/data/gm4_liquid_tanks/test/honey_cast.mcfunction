# @template gm4_liquid_tanks:test_setup
# @dummy ~ ~1 ~
# @timeout 800

# create honey tank
item replace block ~1 ~3 ~1 container.0 with minecraft:honey_block
await not items block ~1 ~3 ~1 container.0 minecraft:honey_block

# place cauldron
setblock ~2 ~3 ~1 cauldron

# link cauldron (dummy faces tank)
execute at @s run tp @s ~ ~ ~ -45 -45
await delay 1s
assert entity @e[tag=gm4_lt_util_block,type=area_effect_cloud] inside

# check casting success
await entity @e[type=item_display,tag=gm4_lt_honey_display] inside
await delay 5s
assert entity @e[type=item,nbt={Item:{id:"minecraft:honey_block"}}] inside
