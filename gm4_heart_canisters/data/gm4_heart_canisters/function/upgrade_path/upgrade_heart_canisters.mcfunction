advancement revoke @s only gm4_heart_canisters:upgrade_path

execute store result score $tier_1 gm4_heart_can run clear @s player_head[minecraft:custom_data~{gm4_heart_canister_tier:1b}]
execute store result score $tier_2 gm4_heart_can run clear @s player_head[minecraft:custom_data~{gm4_heart_canister_tier:2b}]

execute if score $tier_1 gm4_heart_can matches 1.. run function gm4_heart_canisters:upgrade_path/loop_1
execute if score $tier_2 gm4_heart_can matches 1.. run function gm4_heart_canisters:upgrade_path/loop_2
