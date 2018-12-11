#@s=boiling zauber cauldron with grass and enchanted_prismarine_shard and NO poisonous flowers inside.
#at align xyz
#run from recipes/flowers/check_poisonous_flowers

#initialise fake player (required if all flowers are poisonous/gm4_zc_flowers=1)
scoreboard players set normal_flowers_amount gm4_zc_fullness 0
#count normal flowers
execute if score red_tulip gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:red_tulip"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score orange_tulip gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:orange_tulip"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score white_tulip gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:white_tulip"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score pink_tulip gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:pink_tulip"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score oxeye_daisy gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:oxeye_daisy"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score dandelion gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:dandelion"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score blue_orchid gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:blue_orchid"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score allium gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:allium"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score azure_bluet gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:azure_bluet"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1
execute if score poppy gm4_zc_flowers matches 0 if entity @e[type=item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:poppy"}},limit=1,sort=arbitrary] run scoreboard players add normal_flowers_amount gm4_zc_fullness 1

#compare amount of normal flowers in cauldron to expected amount
execute if score normal_flowers_amount gm4_zc_fullness = required_flowers gm4_zc_flowers at @s run function zauber_cauldrons:recipes/flowers/luck
#reset fake players
scoreboard players reset normal_flowers_amount gm4_zc_fullness
