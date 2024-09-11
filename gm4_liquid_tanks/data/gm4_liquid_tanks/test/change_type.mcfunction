# @template gm4_liquid_tanks:test_setup
# @timeout 200

# create lava tank
item replace block ~1 ~3 ~1 container.0 with minecraft:lava_bucket

await entity @e[tag=gm4_liquid_tank,tag=gm4_lt_lava,scores={gm4_lt_value=3,gm4_lt_max=300}] inside

# make sure it doesn't accept water
item replace block ~1 ~3 ~1 container.0 with minecraft:water_bucket

await delay 1s

assert items block ~1 ~3 ~1 container.0 minecraft:water_bucket
assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_lava,scores={gm4_lt_value=3,gm4_lt_max=300}] inside

# empty the lava
data merge block ~1 ~3 ~1 {Items:[]}
await delay 1s

item replace block ~1 ~3 ~1 container.0 with minecraft:bucket

await items block ~1 ~3 ~1 container.0 minecraft:lava_bucket
assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_empty,scores={gm4_lt_value=0}] inside

# change to water tank
data merge block ~1 ~3 ~1 {Items:[]}
await delay 1s

item replace block ~1 ~3 ~1 container.0 with minecraft:water_bucket

await items block ~1 ~3 ~1 container.0 minecraft:bucket
assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_water,scores={gm4_lt_value=3,gm4_lt_max=300}] inside
