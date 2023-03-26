# Check the current player head against a player head from the registry
# @s = player head with a skull name tag
# at world spawn
# run from repair

# Attempt to copy the player head's name to the registry. If this fails, the names match and
# the current registry entry should be used to repair the player head.
execute store success score continue gm4_player_heads run data modify storage gm4_player_heads:register temp[-1].name set from storage gm4_player_heads:register name
execute if score continue gm4_player_heads matches 0 run data modify entity @s Item.tag merge from storage gm4_player_heads:register temp[-1].item
execute if score continue gm4_player_heads matches 1 run data remove storage gm4_player_heads:register temp[-1]
execute if score continue gm4_player_heads matches 1 if data storage gm4_player_heads:register temp[0] run function gm4_player_heads:repair_with_name
