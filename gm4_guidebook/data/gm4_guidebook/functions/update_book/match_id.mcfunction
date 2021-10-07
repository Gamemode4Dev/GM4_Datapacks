# matches the score of @s gm4_guide to the stored modules
# @s = player who used the trigger with the book in their hand
# located at world spawn
# run from gm4_guidebook:replace_book/check_score

# check if the last object of the array has a matching number and call that loot table if so
execute store result score $num_id gm4_guide run data get storage gm4_guidebook:temp_analyze modules[-1].num_id
execute if score $num_id gm4_guide = @s gm4_guide run data modify storage gm4_guidebook:temp LootTable set from storage gm4_guidebook:temp_analyze modules[-1].LootTable

# loop until it finds the correct id
scoreboard players add $count gm4_guide 1
data remove storage gm4_guidebook:temp_analyze modules[-1]
execute unless score $num_id gm4_guide = @s gm4_guide unless score $count gm4_guide > $module_count gm4_guide run function gm4_guidebook:replace_book/match_id
