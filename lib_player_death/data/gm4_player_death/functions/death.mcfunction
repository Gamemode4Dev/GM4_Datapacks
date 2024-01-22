# @s = player that just died
# run from advancement player_death

advancement revoke @s only gm4_player_death:death
scoreboard players reset @s gm4_player_death_count

function #gm4_player_death:_private/death
