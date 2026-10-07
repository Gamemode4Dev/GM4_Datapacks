execute if predicate gm4_swings:jump run return run ride @s dismount

scoreboard players set $has_player gm4_swings.dummy 1

execute if data storage gm4_swings:temp {seat_rotation:0.0f} run return run function gm4_swings:seat/input/z
execute if data storage gm4_swings:temp {seat_rotation:90.0f} run return run function gm4_swings:seat/input/x
execute if data storage gm4_swings:temp {seat_rotation:45.0f} run return run function gm4_swings:seat/input/zx
execute if data storage gm4_swings:temp {seat_rotation:135.0f} run return run function gm4_swings:seat/input/xz