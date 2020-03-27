execute as @e[type=armor_stand,tag=gm4_smeltery,tag=gm4_bf_could_smelt] at @s if block ^ ^ ^1 furnace{CookTime:199s} run function gm4_smelteries:smelt

schedule function gm4_smelteries:tick 1t
