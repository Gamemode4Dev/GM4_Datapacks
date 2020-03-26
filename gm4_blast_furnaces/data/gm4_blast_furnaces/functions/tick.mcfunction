execute as @e[type=armor_stand,tag=gm4_blast_furnace,tag=gm4_bf_could_smelt] at @s if block ^ ^ ^1 furnace{CookTime:199s} run function gm4_blast_furnaces:smelt

schedule function gm4_blast_furnaces:tick 1t
