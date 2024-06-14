# @s = player where the heart canister count changed
# run from check_heart_canisters
attribute @s minecraft:generic.max_health modifier remove minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72

attribute @s[scores={gm4_heart_can=1}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 4 add_value
attribute @s[scores={gm4_heart_can=2}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 8 add_value
attribute @s[scores={gm4_heart_can=3}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 12 add_value
attribute @s[scores={gm4_heart_can=4}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 16 add_value
attribute @s[scores={gm4_heart_can=5}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 20 add_value
attribute @s[scores={gm4_heart_can=6}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 24 add_value
attribute @s[scores={gm4_heart_can=7}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 28 add_value
attribute @s[scores={gm4_heart_can=8}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 32 add_value
attribute @s[scores={gm4_heart_can=9}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 36 add_value
attribute @s[scores={gm4_heart_can=10}] minecraft:generic.max_health modifier add minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72 40 add_value

tag @s[predicate=gm4_heart_canisters:has_health_boost] add gm4_hc_has_effect
effect give @s[tag=!gm4_hc_has_effect] health_boost 1
effect clear @s[tag=!gm4_hc_has_effect] health_boost
tag @s remove gm4_hc_has_effect
