execute as @e[type=minecraft:armor_stand,tag=gm4_fishing_bait] at @s run function gm4_end_fishing:process

#enderpuff mechanics
execute as @a[tag=gm4_enderpuff_levitation,tag=!gm4_has_enderpuff] at @s run function gm4_end_fishing:enderpuff/clear_levitation
execute as @a[tag=gm4_has_enderpuff] run function gm4_end_fishing:enderpuff/process
scoreboard players reset @a gm4_ef_sneak

schedule function gm4_end_fishing:main 16t
