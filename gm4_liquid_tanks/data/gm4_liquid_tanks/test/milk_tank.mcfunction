# @template gm4_liquid_tanks:test_setup

# create milk tank
await delay 1s

summon cow ~1.5 ~4 ~1.5

await entity @e[tag=gm4_liquid_tank,tag=gm4_lt_milk,scores={gm4_lt_value=3,gm4_lt_max=300}] inside

# check cow is on cooldown
await delay 2s

assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_milk,scores={gm4_lt_value=3,gm4_lt_max=300}] inside

# empty the tank
item replace block ~1 ~3 ~1 container.0 with minecraft:bucket

await items block ~1 ~3 ~1 container.0 minecraft:milk_bucket
assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_empty,scores={gm4_lt_value=0}] inside
