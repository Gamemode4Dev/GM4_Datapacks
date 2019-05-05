#@s = potion trading cleric villager converted from witch.
#run from convert_witch
execute store result entity @s Offers.Recipes[0].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[1].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[2].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[3].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[4].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[5].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[6].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
execute store result entity @s Offers.Recipes[7].buy.Count byte 1 run data get entity @e[sort=random,limit=1] UUIDLeast -.0000000000000000007
tag @s remove gm4_randomize_trades
