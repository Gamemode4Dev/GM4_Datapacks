execute as @e[type=minecraft:armor_stand,tag=gm4_end_fishing_bait] at @s run function gm4_end_fishing:process

# enderpuff mechanics
execute as @a[tag=gm4_enderpuff_levitation,tag=!gm4_has_enderpuff] at @s run function gm4_end_fishing:enderpuff/clear_levitation
execute as @a[tag=gm4_has_enderpuff] at @s run function gm4_end_fishing:enderpuff/process

effect give @a[tag=gm4_ef_fall] slow_falling 1 0
tag @a[tag=gm4_ef_fall,nbt={OnGround:0b}] remove gm4_ef_fall

schedule function gm4_end_fishing:main 16t
