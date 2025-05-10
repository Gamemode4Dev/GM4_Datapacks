# gets called for every player with at least 1 heart canister item

# tier 1
scoreboard players set $count_total gm4_heart_can 0
data modify storage gm4_heart_cannisters:temp heart_cannister_data set value []
data modify storage gm4_heart_cannisters:temp heart_cannister_data append from entity @s Inventory[{components:{"minecraft:custom_data":{gm4_heart_canister_tier:1b}}}]
execute store result score $count_add gm4_heart_can run data get entity @s equipment.offhand{components:{"minecraft:custom_data":{gm4_heart_canister_tier:1b}}}.count
scoreboard players operation $count_total gm4_heart_can += $count_add gm4_heart_can
function gm4_heart_canisters:count_heart_canisters
scoreboard players operation $count_total gm4_heart_can < $heart_cannister_cap gm4_heart_can
scoreboard players operation @s gm4_heart_can += $count_total gm4_heart_can

# tier 2
scoreboard players set $count_total gm4_heart_can 0
data modify storage gm4_heart_cannisters:temp heart_cannister_data set value []
data modify storage gm4_heart_cannisters:temp heart_cannister_data append from entity @s Inventory[{components:{"minecraft:custom_data":{gm4_heart_canister_tier:2b}}}]
execute store result score $count_add gm4_heart_can run data get entity @s equipment.offhand{components:{"minecraft:custom_data":{gm4_heart_canister_tier:2b}}}.count
scoreboard players operation $count_total gm4_heart_can += $count_add gm4_heart_can
function gm4_heart_canisters:count_heart_canisters
scoreboard players operation $count_total gm4_heart_can < $heart_cannister_cap gm4_heart_can
scoreboard players operation @s gm4_heart_can += $count_total gm4_heart_can
