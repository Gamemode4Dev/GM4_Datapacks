# @s = goblin if there are nearby players
# run from main

tag @r[gamemode=!creative,gamemode=!spectator,distance=..3] add gm4_goblin_target
execute store result score diamond gm4_menace_data run clear @p[tag=gm4_goblin_target] diamond 0
execute store result score iron_ingot gm4_menace_data run clear @p[tag=gm4_goblin_target] iron_ingot 0
execute store result score gold_ingot gm4_menace_data run clear @p[tag=gm4_goblin_target] gold_ingot 0

# randomizer, (50% diamond, 25% iron, 20% gold attempts will fail)
execute store result score random gm4_menace_data run data get entity @e[limit=1,sort=random] UUID[0]
execute if score random gm4_menace_data matches 30.. if score diamond gm4_menace_data matches 1.. run function gm4_menacing_goblins:goblin_steal/diamond
execute store result score random gm4_menace_data run data get entity @e[limit=1,sort=random] UUID[0]
execute if score random gm4_menace_data matches 15.. if score iron_ingot gm4_menace_data matches 1.. run function gm4_menacing_goblins:goblin_steal/iron_ingot
execute store result score random gm4_menace_data run data get entity @e[limit=1,sort=random] UUID[0]
execute if score random gm4_menace_data matches 10.. if score gold_ingot gm4_menace_data matches 1.. run function gm4_menacing_goblins:goblin_steal/gold_ingot

scoreboard players reset random gm4_menace_data
scoreboard players reset diamond gm4_menace_data
scoreboard players reset iron_ingot gm4_menace_data
scoreboard players reset gold_ingot gm4_menace_data

tag @a remove gm4_goblin_target
