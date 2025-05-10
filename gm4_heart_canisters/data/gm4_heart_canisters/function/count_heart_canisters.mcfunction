# count all heart canisters of this tier in the inventory

execute store result score $count_add gm4_heart_can run data get storage gm4_heart_cannisters:temp heart_cannister_data[0].count
scoreboard players operation $count_total gm4_heart_can += $count_add gm4_heart_can
data remove storage gm4_heart_cannisters:temp heart_cannister_data[0]
execute if data storage gm4_heart_cannisters:temp heart_cannister_data[0] run function gm4_heart_canisters:count_heart_canisters
