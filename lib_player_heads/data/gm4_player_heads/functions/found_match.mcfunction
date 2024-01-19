# Analyze a match found in the player registry and apply data from the given source
# @s = player head with a match in the registry
# at world spawn
# run from repair_with_name and repair_with_texture

# decide whether to restore from raw nbt (legacy) or from loot table
data remove storage gm4_player_heads:register macro
execute store success score $use_loot_table gm4_player_heads run data modify storage gm4_player_heads:register macro.loot_table set from storage gm4_player_heads:register temp[-1].loot_table

# apply data to item
execute unless score $use_loot_table gm4_player_heads matches 1 run data modify entity @s Item.tag merge from storage gm4_player_heads:register temp[-1].item
execute if score $use_loot_table gm4_player_heads matches 1 at @s run function gm4_player_heads:call_loot_table with storage gm4_player_heads:register macro
