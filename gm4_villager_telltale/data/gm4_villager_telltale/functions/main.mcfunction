
schedule function gm4_villager_telltale:main 3s

execute as @e[type=villager,tag=gm4_vt_looking] run function gm4_villager_telltale:villager/stop_looking

execute as @a at @s run function gm4_villager_telltale:player