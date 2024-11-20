# checks the LootTableSeed of the chest, and inserts for 45% of them
# @s = player that just looted the chest
# located at the chest
# run from gm4_guidebook:get_book/chest/ray

# modulo the loot table seed to 0-99
execute store result score $loot_table_seed gm4_guide run data get block ~ ~ ~ LootTableSeed 0.0000000001
scoreboard players operation $loot_table_seed gm4_guide %= #100 gm4_guide

# for 0-44, insert the guidebook
$execute if score $loot_table_seed gm4_guide matches ..44 run loot insert ~ ~ ~ loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:items/guidebook","functions":[{"function":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:1}}"},{"function":"minecraft:set_components","components":{"minecraft:written_book_content":{"pages":$(front_matter),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3}}}]}]}]}
