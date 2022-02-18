
schedule function gm4_rope_ladders:tick 1t

execute as @a if score @s gm4_rol_b_ladder matches 1.. at @s run function gm4_rope_ladders:update_ladders/as_player
