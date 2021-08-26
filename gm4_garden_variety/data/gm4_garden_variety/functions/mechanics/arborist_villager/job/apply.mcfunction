# run from TODO


# reset debug storage
data remove storage gm4_garden_variety:debug/arborist trades

# display particles
particle minecraft:happy_villager ~ ~1 ~ .3 .5 .3 .1 10

# add tag
tag @s add gm4_gv_arborist

# scorboards
scoreboard players set @s gm4_gv_prev_xp 0

# set nbt data
data modify entity @s VillagerData.profession set value "minecraft:nitwit"
data modify entity @s Offers.Recipes set value []

# set random name
loot replace entity @s weapon loot gm4_garden_variety:arborist/names
data modify entity @s CustomName set from entity @s HandItems[{id:"minecraft:oak_sapling"}].tag.display.Name

# set restock amounts
scoreboard players set @s gm4_gv_trades 2

# give level 1 trades
execute at @s run function gm4_garden_variety:mechanics/arborist_villager/levels/level_1





