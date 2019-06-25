#@s = minecarts under spawners
#run from main

summon spawner_minecart ~ ~ ~ {Tags:["gm4_spawner_minecart","gm4_init"]}
execute as @e[tag=gm4_spawner_minecart,tag=gm4_init,limit=1,distance=0] run function spawner_minecarts:capture_spawner/finalize_enter_minecart
kill @s
