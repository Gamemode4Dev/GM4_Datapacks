# checks the LootTableSeed of the chest, and inserts for 45% of them
# @s = player that just looted the chest
# located at the chest
# run from gm4_guidebook:update_book/chest/looted

# modulo the loot table seed to 0-99
execute store result score $loot_table_seed gm4_guide run data get block ~ ~ ~ LootTableSeed 0.0000000001
scoreboard players operation $loot_table_seed gm4_guide %= #100 gm4_guide

# for 0-44, insert the guidebook
execute if score $loot_table_seed gm4_guide matches ..44 run loot insert ~ ~ ~ loot gm4_guidebook:items/guidebook
