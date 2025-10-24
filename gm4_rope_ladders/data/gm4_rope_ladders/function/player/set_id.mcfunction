# @s = player
# at @s
# run from advancement: gm4_rope_ladders:id_init

# revoke to handle username changes
advancement revoke @s only gm4_rope_ladders:id_init

execute store result score @s gm4_rol_id run scoreboard players add $next gm4_rol_id 1
