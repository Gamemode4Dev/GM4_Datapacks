#@s = player that has mined sand while underwater
#at = position of sand item
#run from pulse_check

#type of treasure to spawn based on fortune level and random numbers
#treasureType = 0 -> no treasure
#treasureType = 1 -> item treasure
#treasureType = 2 -> squid entity
#treasureType = 3 -> guardian entity
execute store result score treasureType gm4_st_random run loot spawn ~ -1024 ~ fish sunken_treasure:function/treasure_type ~ 0 ~ mainhand

#spawn treasure based on treasureType
execute if score treasureType gm4_st_random matches 1 unless score scuba_gear gm4_modules matches 1.. run loot spawn ~ ~ ~ loot gm4_sunken_treasure:item_treasure
execute if score treasureType gm4_st_random matches 1 if score scuba_gear gm4_modules matches 1.. run loot spawn ~ ~ ~ loot gm4_sunken_treasure:item_treasure_scuba
execute if score treasureType gm4_st_random matches 2 run summon minecraft:squid ~ ~ ~
execute if score treasureType gm4_st_random matches 3 run summon minecraft:guardian ~ ~ ~

#kill sand if treasureType = 1 to replicate previous versions
execute if score treasureType gm4_st_random matches 1 run kill @e[type=minecraft:item,limit=1,dx=0,dy=0,dz=0,distance=0,nbt={Item:{id:"minecraft:sand"},Age:0s}]