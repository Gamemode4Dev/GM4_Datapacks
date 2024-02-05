# @template gm4_liquid_tanks:test_setup

# create lava tank
data merge block ~1 ~3 ~1 {Items:[{Slot:0b,id:"minecraft:lava_bucket",Count:1b}]}

await block ~1 ~3 ~1 hopper{Items:[{Slot:0b,id:"minecraft:bucket",Count:1b}]}
assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_lava,scores={gm4_lt_value=3,gm4_lt_max=300}] inside

# empty the tank
data merge block ~1 ~3 ~1 {Items:[]}
await delay 1s

data merge block ~1 ~3 ~1 {Items:[{Slot:0b,id:"minecraft:bucket",Count:1b}]}

await block ~1 ~3 ~1 hopper{Items:[{Slot:0b,id:"minecraft:lava_bucket",Count:1b}]}
assert entity @e[tag=gm4_liquid_tank,tag=gm4_lt_empty,scores={gm4_lt_value=0}] inside

# try bucket on empty tank
data merge block ~1 ~3 ~1 {Items:[{Slot:0b,id:"minecraft:bucket",Count:1b}]}

await delay 1s

assert block ~1 ~3 ~1 hopper{Items:[{Slot:0b,id:"minecraft:bucket",Count:1b}]}
