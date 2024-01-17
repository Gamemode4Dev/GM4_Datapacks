
execute at @s run fill ~ ~ ~ ~ ~-1 ~ air replace light[waterlogged=false]
execute at @s run fill ~ ~ ~ ~ ~-1 ~ water replace light[waterlogged=true]

execute on passengers run kill @s
kill @s
