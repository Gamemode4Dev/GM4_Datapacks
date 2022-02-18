# updates nearby ladders when player breaks ladder
# @s = player that broke a ladder
# at @s
# run from gm4_rope_ladders:as_player

scoreboard players reset @s gm4_rol_b_ladder

execute as @e[type=item,distance=..7,limit=1,nbt={Item:{id:"minecraft:ladder"}}] at @s run clone ~-2 ~-20 ~-2 ~2 ~20 ~2 ~-2 ~-20 ~-2 filtered air force
