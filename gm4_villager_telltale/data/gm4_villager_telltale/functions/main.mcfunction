
schedule function gm4_villager_telltale:main 3s

execute as @e[type=villager,tag=gm4_vt_looking] run function gm4_villager_telltale:villager/stop_looking

tag @a remove gm4_tv_holding_villager_block
execute as @a[predicate=gm4_villager_telltale:holding_all_villager_blocks] at @s run function gm4_villager_telltale:player