# Apply the stored nbt data from the registry to the player head item on the ground
# @s = player head with a match in the registry
# at world spawn
# run from repair_with_name and repair_with_texture

# prepare register data
scoreboard players set $enforce_unstackable gm4_player_heads 0
execute store result score $enforce_unstackable gm4_player_heads run data get storage gm4_player_heads:register temp[-1].unstackable

# enforce unstackable if flag was set in register
execute if score $enforce_unstackable gm4_player_heads matches 1.. run data modify storage gm4_player_heads:register temp[-1].item.gm4_player_heads.uuid set from entity @s UUID[3]

# apply data to item
data modify entity @s Item.tag merge from storage gm4_player_heads:register temp[-1].item
