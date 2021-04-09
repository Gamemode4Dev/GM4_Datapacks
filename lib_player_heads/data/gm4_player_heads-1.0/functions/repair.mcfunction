# Manages head repairs
# @s = player head item with texture
# at world spawn
# run from main

data modify storage gm4_player_heads:register temp set from entity @s Item.tag.SkullOwner.Properties.textures[0].Value
execute store result score loop gm4_player_heads run data get storage gm4_player_heads:register heads

execute if score loop gm4_player_heads matches 1.. run function gm4_player_heads-1.0:repair_loop

tag @s add gm4_player_heads_scanned
