execute as @e[type=minecraft:armor_stand,tag=gm4_fishing_bait] at @s run function gm4_end_fishing:process

#enderpuff mechanics
tag @a remove gm4_hold_enderpuff
execute as @a[gamemode=!spectator] if data entity @s Inventory[].tag.gm4_enderpuff run function gm4_end_fishing:enderpuff/track_inventory
execute as @a[nbt={ActiveEffects:[{Id:25b,Amplifier:1b}]}] unless data entity @s Inventory[].tag.gm4_enderpuff run effect clear @s levitation

#fix enderpuff head
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"77be3116-c31a-4124-83a0-62714e692f2d"}}}}] run data merge entity @s {Item:{tag:{CustomModelData:14,gm4_enderpuff:1b,display:{Name:'{"translate":"%1$s%3427655$s","with":["Enderpuff",{"translate":"item.gm4.enderpuff"}],"italic":false}'}}}}

schedule function gm4_end_fishing:main 16t
