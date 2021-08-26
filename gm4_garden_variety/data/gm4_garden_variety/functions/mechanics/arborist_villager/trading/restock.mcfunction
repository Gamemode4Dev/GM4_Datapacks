# run from TODO

playsound minecraft:entity.villager.work_farmer neutral @a[distance=..20]
particle minecraft:block oak_sapling ~ ~1 ~ 0 0 0 1 3

# Trades (1+3+4+3+3+1=15)
data modify entity @s Offers.Recipes[0].uses set value 0
data modify entity @s Offers.Recipes[1].uses set value 0
data modify entity @s Offers.Recipes[2].uses set value 0
data modify entity @s Offers.Recipes[3].uses set value 0
data modify entity @s Offers.Recipes[4].uses set value 0
data modify entity @s Offers.Recipes[5].uses set value 0
data modify entity @s Offers.Recipes[6].uses set value 0
data modify entity @s Offers.Recipes[7].uses set value 0
data modify entity @s Offers.Recipes[8].uses set value 0
data modify entity @s Offers.Recipes[9].uses set value 0
data modify entity @s Offers.Recipes[10].uses set value 0
data modify entity @s Offers.Recipes[11].uses set value 0
data modify entity @s Offers.Recipes[12].uses set value 0
data modify entity @s Offers.Recipes[13].uses set value 0
data modify entity @s Offers.Recipes[14].uses set value 0

#scoreboard players remove @s gm4_gv_trades 1
tag @s remove gm4_gv_can_restock
