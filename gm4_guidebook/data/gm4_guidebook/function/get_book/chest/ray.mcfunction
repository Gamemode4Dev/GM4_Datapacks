# raycasts to the chest
# @s = marker ray used to detect the chest
# located at @s
# run from gm4_guidebook:get_book/looted
# run from self

execute if data block ~ ~ ~ LootTable run scoreboard players set $found gm4_guide 1
$execute if score $found gm4_guide matches 1 unless data block ~ ~ ~ LootTableSeed if predicate gm4_guidebook:chance_chest run loot insert ~ ~ ~ loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:items/guidebook","functions":[{"function":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:1}}"},{"function":"minecraft:set_components","components":{"minecraft:written_book_content":{"pages":$(front_matter),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3}}}]}]}]}
execute if score $found gm4_guide matches 1 if data block ~ ~ ~ LootTableSeed run function gm4_guidebook:get_book/chest/insert_seed_random with storage gm4_guidebook:register
scoreboard players remove $ray gm4_guide 1
execute if score $found gm4_guide matches 0 if score $ray gm4_guide matches 1.. positioned ^ ^ ^0.1 run function gm4_guidebook:get_book/chest/ray with storage gm4_guidebook:register
