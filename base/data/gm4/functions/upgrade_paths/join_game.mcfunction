# @s =  runs as a player who has just rejoined the world
# at @s
# run from gm4:upgrade_paths/join_game advancement
advancement revoke @s only gm4:upgrade_paths/join_game
scoreboard players reset @s gm4_up_leave_game
function #gm4_upgrade_paths:run
