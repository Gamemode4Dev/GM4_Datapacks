# @dummy

loot give @s loot gm4_heart_canisters:items/tier_1_heart_canister
loot give @s loot gm4_heart_canisters:items/tier_1_heart_canister
loot give @s loot gm4_heart_canisters:items/tier_1_heart_canister
loot give @s loot gm4_heart_canisters:items/tier_1_heart_canister
loot give @s loot gm4_heart_canisters:items/tier_1_heart_canister

loot give @s loot gm4_heart_canisters:items/tier_2_heart_canister

await delay 1s

scoreboard objectives add gm4_test dummy
execute store result score $max_health gm4_test run attribute @s minecraft:generic.max_health get
assert score $max_health gm4_test matches 44

loot give @s loot gm4_heart_canisters:items/tier_2_heart_canister

await delay 1s

execute store result score $max_health gm4_test run attribute @s minecraft:generic.max_health get
assert score $max_health gm4_test matches 48
