# @s = potion trading cleric villager converted from witch.
# run from convert_witch

# randomise recipes using the UUID of the newly summoned villager
execute store result score #uuid gm4_mob_con_data run data get entity @s UUID[0]
execute if score #uuid gm4_mob_con_data matches ..-1 run scoreboard players operation #uuid gm4_mob_con_data *= #-1 gm4_mob_con_data
scoreboard players operation #uuid gm4_mob_con_data /= #8 gm4_mob_con_data

scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[0].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

scoreboard players operation #uuid gm4_mob_con_data /= #5 gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[1].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

scoreboard players operation #uuid gm4_mob_con_data /= #5 gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[2].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

scoreboard players operation #uuid gm4_mob_con_data /= #5 gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[3].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

scoreboard players operation #uuid gm4_mob_con_data /= #5 gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[4].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

scoreboard players operation #uuid gm4_mob_con_data /= #5 gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[5].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

scoreboard players operation #uuid gm4_mob_con_data /= #5 gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[6].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

scoreboard players operation #uuid gm4_mob_con_data /= #5 gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data = #uuid gm4_mob_con_data
scoreboard players operation #count gm4_mob_con_data %= #5 gm4_mob_con_data
execute store result entity @s Offers.Recipes[7].buy.Count byte 1 run scoreboard players add #count gm4_mob_con_data 2

# set curer
execute if data entity @e[type=minecraft:item,limit=1,distance=..3,tag=gm4_gapple] Thrower run function gm4_mob_conversion:set_curer
tag @s remove gm4_mob_conversions_needs_init
