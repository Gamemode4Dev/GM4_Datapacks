# @template gm4_liquid_tanks:test_setup

# create milk tank
await delay 1s

summon cow ~1.5 ~4 ~1.5

await entity @e[tag=gm4_liquid_tank,tag=gm4_lt_milk,scores={gm4_lt_value=3,gm4_lt_max=300}] inside

# check cow is on cooldown
await delay 2s

assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_milk,scores={gm4_lt_value=3,gm4_lt_max=300}] inside

# empty the tank
data merge block ~1 ~3 ~1 {Items:[{Slot:0b,id:"minecraft:bucket",Count:1b}]}

await block ~1 ~3 ~1 hopper{Items:[{Slot:0b,id:"minecraft:milk_bucket",Count:1b}]}
assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_empty,scores={gm4_lt_value=0}] inside
