schedule function gm4_spawner_minecarts:main 16t

# check for minecarts under spawners
execute as @e[type=minecart,tag=!smithed.entity] at @s if block ~ ~1 ~ spawner align xyz positioned ~0.5 ~1.5 ~0.5 unless entity @e[tag=smithed.block,distance=..0.5,limit=1] at @s if block ~ ~2 ~ #gm4_spawner_minecarts:piston[facing=down] if block ~ ~3 ~ redstone_block run function gm4_spawner_minecarts:capture_spawner

#process all spawner minecarts
execute as @e[type=spawner_minecart,tag=gm4_spawner_minecart] at @s run function gm4_spawner_minecarts:process
