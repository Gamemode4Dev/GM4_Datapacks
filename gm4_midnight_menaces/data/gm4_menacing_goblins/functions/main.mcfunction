execute as @e[type=zombie,tag=gm4_goblin,tag=!smithed.entity] run function gm4_menaging_goblins:upgrade_path/smithed_compat
execute as @e[type=zombie,tag=gm4_goblin] unless entity @s[tag=gm4_goblin_diamond_full,tag=gm4_goblin_iron_full,tag=gm4_goblin_gold_full] at @s if entity @a[limit=1,distance=..3] run function gm4_menacing_goblins:goblin_steal/check_player

schedule function gm4_menacing_goblins:main 16t
