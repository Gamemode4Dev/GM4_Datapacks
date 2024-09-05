# use spreadplayer command if other method fails
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/attempt

# search for the correct height
execute store result storage gm4_combat_expanded:temp vorpal.max_y int 1 run scoreboard players add $y_pos gm4_ce_data 8
execute as @e[type=marker,tag=gm4_ce_vorpal] run function gm4_combat_expanded:armor/modifier/type/vorpal/eval_failsafe with storage gm4_combat_expanded:temp vorpal
data remove storage gm4_combat_expanded:temp vorpal

# teleport
function gm4_combat_expanded:armor/modifier/type/vorpal/tp_player
