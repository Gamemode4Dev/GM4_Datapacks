# checks if nearby players have any valuables
# @s = goblin if there are nearby players
# located at @s
# run from main

tag @r[gamemode=!creative,gamemode=!spectator,distance=..3] add gm4_goblin_target
execute store result score diamond gm4_menace_data run clear @a[tag=gm4_goblin_target,limit=1,distance=..3] diamond 0
execute store result score iron_ingot gm4_menace_data run clear @a[tag=gm4_goblin_target,limit=1,distance=..3] iron_ingot 0
execute store result score gold_ingot gm4_menace_data run clear @a[tag=gm4_goblin_target,limit=1,distance=..3] gold_ingot 0

# randomizer, (50% diamond, 25% iron, 20% gold attempts will fail)
execute if score diamond gm4_menace_data matches 1.. unless entity @s[tag=gm4_goblin_diamond_full] if predicate gm4_menacing_goblins:diamond_steal_chance run function gm4_menacing_goblins:goblin_steal/diamond
execute if score iron_ingot gm4_menace_data matches 1.. unless entity @s[tag=gm4_goblin_iron_full] if predicate gm4_menacing_goblins:iron_steal_chance run function gm4_menacing_goblins:goblin_steal/iron_ingot
execute if score gold_ingot gm4_menace_data matches 1.. unless entity @s[tag=gm4_goblin_gold_full] if predicate gm4_menacing_goblins:gold_steal_chance run function gm4_menacing_goblins:goblin_steal/gold_ingot

scoreboard players reset diamond gm4_menace_data
scoreboard players reset iron_ingot gm4_menace_data
scoreboard players reset gold_ingot gm4_menace_data

tag @a remove gm4_goblin_target
