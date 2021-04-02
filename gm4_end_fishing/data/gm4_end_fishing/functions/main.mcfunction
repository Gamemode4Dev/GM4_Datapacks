execute as @e[type=minecraft:armor_stand,tag=gm4_fishing_bait] at @s run function gm4_end_fishing:process

#enderpuff mechanics
execute as @a[tag=gm4_enderpuff_levitation,tag=!gm4_has_enderpuff] at @s run function gm4_end_fishing:enderpuff/clear_levitation
execute as @a[tag=gm4_has_enderpuff] run function gm4_end_fishing:enderpuff/process
scoreboard players reset @a gm4_ef_sneak

#fix enderpuff head
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-749248143,1561284060,-1964497486,1336566238]}}}}] run data merge entity @s {Item:{tag:{CustomModelData:14,gm4_end_fishing:{enderpuff:1b},display:{Name:'{"translate":"%1$s%3427655$s","with":["Enderpuff",{"translate":"item.gm4.enderpuff"}],"italic":false}'}}}}

schedule function gm4_end_fishing:main 16t
