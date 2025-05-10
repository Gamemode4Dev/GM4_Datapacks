# gets called for every player with at least 1 heart canister item

# tier 1
execute store result score @s gm4_heart_can if items entity @s container.* poisonous_potato[custom_data~{gm4_heart_canister_tier:1b}]
execute store result score $count_add gm4_heart_can if items entity @s weapon.offhand poisonous_potato[custom_data~{gm4_heart_canister_tier:1b}]
scoreboard players operation @s gm4_heart_can += $count_add gm4_heart_can
scoreboard players operation @s gm4_heart_can < $heart_cannister_cap gm4_heart_can

# tier 2
execute store result score $count_tier2 gm4_heart_can if items entity @s container.* poisonous_potato[custom_data~{gm4_heart_canister_tier:2b}]
execute store result score $count_add gm4_heart_can if items entity @s weapon.offhand poisonous_potato[custom_data~{gm4_heart_canister_tier:2b}]
scoreboard players operation $count_tier2 gm4_heart_can += $count_add gm4_heart_can
scoreboard players operation $count_tier2 gm4_heart_can < $heart_cannister_cap gm4_heart_can
scoreboard players operation @s gm4_heart_can += $count_tier2 gm4_heart_can
