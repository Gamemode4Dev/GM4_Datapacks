# raycasts to the chest
# @s = marker ray used to detect the chest
# located at @s
# run from gm4_guidebook:get_book/looted
# run from self

execute if data block ~ ~ ~ LootTable run scoreboard players set $found gm4_guide 1
execute if score $found gm4_guide matches 1 unless data block ~ ~ ~ LootTableSeed if predicate gm4_guidebook:chance_chest run loot insert ~ ~ ~ loot gm4_guidebook:guidebook
execute if score $found gm4_guide matches 1 if data block ~ ~ ~ LootTableSeed run function gm4_guidebook:get_book/chest/insert_seed_random
scoreboard players remove $ray gm4_guide 1
execute if score $found gm4_guide matches 0 if score $ray gm4_guide matches 1.. positioned ^ ^ ^0.1 run function gm4_guidebook:get_book/chest/ray
