execute as @e[type=zombie,tag=gm4_goblin,tag=!smithed.entity] run function gm4_menaging_goblins:upgrade_path/smithed_compat
execute as @e[type=zombie,tag=gm4_goblin] at @s if entity @a[limit=1,distance=..3] run function gm4_menacing_goblins:goblin_steal/check_player

schedule function gm4_menacing_goblins:main 16t
