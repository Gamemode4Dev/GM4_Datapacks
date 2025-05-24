# @s = player where the heart canister count changed
# run from check_heart_canisters
attribute @s minecraft:max_health modifier remove minecraft:38a576e7-341b-46ed-a9e3-7b7291beae72

execute store result storage gm4_heart_cannisters:temp amount int 4 run scoreboard players get @s gm4_heart_can
function gm4_heart_canisters:eval_health_boost with storage gm4_heart_cannisters:temp
data remove storage gm4_heart_cannisters:temp amount

tag @s[predicate=gm4_heart_canisters:has_health_boost] add gm4_hc_has_effect
effect give @s[tag=!gm4_hc_has_effect] health_boost 1
effect clear @s[tag=!gm4_hc_has_effect] health_boost
tag @s remove gm4_hc_has_effect
