# @s = goblin that's stealing an item
# run from goblin_steal/diamond and goblin_steal/iron_ingot and goblin_steal/gold_ingot

# randomizer 2% of the time, the item will not add to the goblin's inventory
execute store result score random gm4_menace_data run data get entity @e[limit=1,sort=random] UUID[0]
execute if score random gm4_menace_data matches 2.. run scoreboard players add count gm4_menace_data 1

execute store result entity @s ArmorItems[1].Count byte 1 run scoreboard players get count gm4_menace_data
