# Checks available skulls against current one and repairs the skull
# @s = player head item with texture
# at world spawn
# run from repair

data modify storage gm4_player_heads:register temp1 set from storage gm4_player_heads:register temp
execute store success score continue gm4_player_heads run data modify storage gm4_player_heads:register temp1 set from storage gm4_player_heads:register heads[0].value

scoreboard players remove loop gm4_player_heads 1
execute if score continue gm4_player_heads matches 0 run data modify entity @s Item.tag merge from storage gm4_player_heads:register heads[0].item
execute if score continue gm4_player_heads matches 1 if score loop gm4_player_heads matches 1.. run function gm4_player_heads-1.0:repair_continue
