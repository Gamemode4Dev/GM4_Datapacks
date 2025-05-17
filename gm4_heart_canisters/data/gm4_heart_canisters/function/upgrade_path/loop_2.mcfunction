
execute if score $tier_2 gm4_heart_can matches 1.. run loot give @s loot gm4_heart_canisters:items/tier_2_heart_canister
scoreboard players remove $tier_2 gm4_heart_can 1
execute if score $tier_2 gm4_heart_can matches 1.. run function gm4_heart_canisters:upgrade_path/loop_2
