# executes as the player the broke a ladder
# @s = player
# at @s
# run from gm4_rope_ladders:tick

scoreboard players reset @s gm4_rol_b_ladder

execute as @e[type=item,distance=..7,limit=1,nbt={Item:{id:"minecraft:ladder"},Age:0s}] at @s if block ~ ~ ~ air if block ~ ~-1 ~ ladder align xyz positioned ~.5 ~-1 ~.5 run function gm4_rope_ladders:update_ladders/scan_column/init
