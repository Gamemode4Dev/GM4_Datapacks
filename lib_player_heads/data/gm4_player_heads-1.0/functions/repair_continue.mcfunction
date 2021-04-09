# Checks next head entry
# @s = player head item with texture
# at world spawn
# run from repair_loop

data modify storage gm4_player_heads:register heads append from storage gm4_player_heads:register heads[0]
data remove storage gm4_player_heads:register heads[0]
function gm4_player_heads-1.0:repair_loop
