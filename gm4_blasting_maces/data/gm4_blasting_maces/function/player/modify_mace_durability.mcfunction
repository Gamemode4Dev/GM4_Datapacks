# Reduces the durability of the blasting mace according to the number of blocks broken
# @s = player with blasting mace who just broke blocks
# at @s
# run from gm4_blasting_maces:player/blast

# get max damage - 1 for mace (durability 500)
scoreboard players set $max_damage gm4_blast_data 499

# get unbreaking level (increases durability by reducing damage chance)
execute store result score $unbreaking_level gm4_blast_data run data get storage gm4_blasting_maces:temp tool.components."minecraft:enchantments"."minecraft:unbreaking"
scoreboard players add $unbreaking_level gm4_blast_data 1
scoreboard players set $damage_chance gm4_blast_data 100
scoreboard players operation $damage_chance gm4_blast_data /= $unbreaking_level gm4_blast_data

# calculate and apply damage using binomial distribution
execute store result score $current_damage gm4_blast_data run data get storage gm4_blasting_maces:temp tool.components."minecraft:damage"
execute store result score $incoming_damage gm4_blast_data run loot spawn ~ -4096 ~ loot gm4_blasting_maces:roll_binomial_distribution
scoreboard players operation $current_damage gm4_blast_data += $incoming_damage gm4_blast_data
scoreboard players operation $current_damage gm4_blast_data < $max_damage gm4_blast_data

# apply the new damage value
execute store result storage gm4_blasting_maces:temp damage int 1 run scoreboard players get $current_damage gm4_blast_data
function gm4_blasting_maces:player/set_damage with storage gm4_blasting_maces:temp
