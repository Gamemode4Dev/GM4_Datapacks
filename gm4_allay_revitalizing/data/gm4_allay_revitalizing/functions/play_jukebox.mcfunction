# finds the jukebox the player clicked on
# @s = player that used a music disc on a jukebox
# at @s
# run from advancement play_jukebox

advancement revoke @s only gm4_allay_revitalizing:play_jukebox

# sets raycast limit
scoreboard players set $ray gm4_count 50

# runs raycast loop
function gm4_allay_revitalizing:raycast
