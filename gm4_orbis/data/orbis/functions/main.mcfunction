execute at @a[tag=!orbis_disabled] positioned ~-8 ~ ~-8 as @e[tag=orbis_chunk,tag=!orbis_generated,sort=nearest,limit=1] at @s run function orbis:chunk/generate
execute as @e[tag=orbis_chunk,tag=orbis_generated] at @s run function orbis:chunk/kill
execute as @a[tag=!orbis_disabled] at @s unless block ~ 0 ~ barrier run function orbis:chunk/init
