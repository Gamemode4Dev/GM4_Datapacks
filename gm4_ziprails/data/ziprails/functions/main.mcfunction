#identify minecart types
tag @e[type=minecart] add gm4_minecart
tag @e[type=chest_minecart] add gm4_minecart
tag @e[type=hopper_minecart] add gm4_minecart
tag @e[type=furnace_minecart] add gm4_minecart
tag @e[type=spawner_minecart] add gm4_minecart
tag @e[type=tnt_minecart] add gm4_minecart


#advancement
execute as @e[tag=gm4_minecart,tag=gm4_linked] at @s run advancement grant @p[distance=..1] only gm4:ziprails
