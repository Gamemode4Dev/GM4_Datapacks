# Forces a player to do an Infinitas tag check
# @s = player rejoining world
# at @s
# run from advancement, gm4_infinitas_shamir:rejoin_bucket_check

advancement revoke @s only gm4_infinitas_shamir:rejoin_bucket_check
scoreboard players reset @s gm4_infinitas_leave
function gm4_infinitas_shamir:add_tags
