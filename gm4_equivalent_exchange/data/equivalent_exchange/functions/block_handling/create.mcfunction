#@s = @e[tag=custom_crafter] with alchemical crafter recipe inside
#Run from recipe_check

data merge entity @s {Tags:["gm4_no_edit","gm4_alchemical_crafter"],CustomName:'"gm4_alchemical_crafter"',ArmorItems:[{},{},{},{id:"redstone_block",Count:1,tag:{CustomModelData:1,Enchantments:[{}]}}]}
data merge block ~ ~ ~ {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Alchemical Crafter",{"translate":"item.gm4.alchemical_crafter"}],"color":"red"}'}
playsound minecraft:block.beacon.power_select block @a[distance=..6] ~ ~ ~ 1 2
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:equivalent_exchange
