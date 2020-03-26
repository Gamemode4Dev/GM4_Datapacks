#blast furnace processes
execute as @e[type=armor_stand,tag=gm4_blast_furnace] at @s run function gm4_blast_furnaces:process

schedule function gm4_blast_furnaces:main 16t
