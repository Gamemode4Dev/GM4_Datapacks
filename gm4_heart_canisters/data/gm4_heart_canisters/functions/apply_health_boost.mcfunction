# @s = player where the heart canister count changed
# run from check_heart_canisters
attribute @s minecraft:generic.max_health modifier remove 38a576e7-341b-46ed-a9e3-7b7291beae72

attribute @s[scores={gm4_heart_can=1}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 4 add
attribute @s[scores={gm4_heart_can=2}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 8 add
attribute @s[scores={gm4_heart_can=3}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 12 add
attribute @s[scores={gm4_heart_can=4}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 16 add
attribute @s[scores={gm4_heart_can=5}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 20 add
attribute @s[scores={gm4_heart_can=6}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 24 add
attribute @s[scores={gm4_heart_can=7}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 28 add
attribute @s[scores={gm4_heart_can=8}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 32 add
attribute @s[scores={gm4_heart_can=9}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 36 add
attribute @s[scores={gm4_heart_can=10}] minecraft:generic.max_health modifier add 38a576e7-341b-46ed-a9e3-7b7291beae72 gm4_hc_health_boost 40 add

tag @s[predicate=gm4_heart_canisters:has_health_boost] add gm4_hc_has_effect
effect give @s[tag=!gm4_hc_has_effect] health_boost 1
effect clear @s[tag=!gm4_hc_has_effect] health_boost
tag @s remove gm4_hc_has_effect
