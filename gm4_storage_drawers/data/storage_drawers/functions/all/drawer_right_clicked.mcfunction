#run from main
#@s = as and at drawer right clicked

execute at @p[scores={gm4_sd_sneaking=0}, sort=nearest, distance=..3] if entity @s[scores={gm4_sd_amount=1..}] run function storage_drawers:all/give_player_single
execute at @p[scores={gm4_sd_sneaking=1}, sort=nearest, distance=..3] if entity @s[scores={gm4_sd_amount=64..}] run function storage_drawers:all/give_player_stack
function storage_drawers:all/display_amount

data modify entity @s ItemRotation set value 0