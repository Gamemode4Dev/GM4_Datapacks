# Revokes advancement and restarts wait_for_respawn clock
# @s = player that has re-joined with a gm4_animi_deaths score
# at @s
# run from advancement gm4_animi_shamir:join

# reset advancement and score
advancement revoke @s only gm4_animi_shamir:join
scoreboard players reset @s gm4_animi_leave

# if the player has a gm4_animi_deaths score, restart waiting_for_respawn clock
execute if score @s gm4_animi_deaths matches 1.. run schedule function gm4_animi_shamir:player/wait_for_respawn 1t
