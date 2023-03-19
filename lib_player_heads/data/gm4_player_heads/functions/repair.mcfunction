# Repair player head if found in player head registry, then exclude it from further processing
# @s = player head item
# at world spawn
# run from main

# Clear out storage from previous executions.
data remove storage gm4_player_heads:register name
data remove storage gm4_player_heads:register texture

# Attempt to retrieve the player head's name and texture. If neither tags exist,
# the repair process will not be attempted.
execute store success score continue gm4_player_heads run data modify storage gm4_player_heads:register name set from entity @s Item.tag.SkullOwner.Name
execute if score continue gm4_player_heads matches 0 store success score continue gm4_player_heads run data modify storage gm4_player_heads:register texture set from entity @s Item.tag.SkullOwner.Properties.textures[0].Value

# Repair the player head using the selected method.
execute if score continue gm4_player_heads matches 1 run data modify storage gm4_player_heads:register temp set from storage gm4_player_heads:register heads
execute if data storage gm4_player_heads:register name run function gm4_player_heads:repair_with_name
execute if data storage gm4_player_heads:register texture run function gm4_player_heads:repair_with_texture
data remove storage gm4_player_heads:register temp

# Tag this entity to exclude it from future processing.
tag @s add gm4_player_heads_scanned
