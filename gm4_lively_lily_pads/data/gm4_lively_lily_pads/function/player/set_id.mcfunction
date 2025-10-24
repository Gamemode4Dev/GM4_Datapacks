# @s = player
# at @s 
# run from advancement: id_init

# revoke to handle username changes
advancement revoke @s only gm4_lively_lily_pads:id_init

scoreboard players operation @s gm4_llp.id = $next gm4_llp.id
scoreboard players add $next gm4_llp.id 1
