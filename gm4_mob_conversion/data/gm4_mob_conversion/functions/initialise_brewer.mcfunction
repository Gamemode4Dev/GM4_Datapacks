# @s = potion trading cleric villager converted from witch.
# run from convert_witch

# randomise recipes
execute store result entity @s Offers.Recipes[0].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[1].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[2].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[3].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[4].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[5].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[6].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[7].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007

# set curer
execute if entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple,nbt={Thrower:{}}] run function mob_conversion:set_curer
data remove entity @s HandItems[1]
tag @s remove gm4_mob_conversions_needs_init
