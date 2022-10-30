#run from main
#@s = players holding a lumos tool

execute store success score $has_torches gm4_ml_data run clear @s torch 0
execute at @s if score $has_torches gm4_ml_data matches 1 if predicate gm4_lumos_shamir:check_air unless block ~ ~ ~ #gm4:water unless block ~ ~-1 ~ #gm4_lumos_shamir:torch_unplaceable if predicate gm4_lumos_shamir:check_block run function gm4_lumos_shamir:place_torch
