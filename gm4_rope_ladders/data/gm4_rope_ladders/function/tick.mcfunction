
schedule function gm4_rope_ladders:tick 1t

# check if player broke ladder
execute as @a if score @s gm4_rol_break_ladder matches 1.. at @s run function gm4_rope_ladders:player/broke_ladder
