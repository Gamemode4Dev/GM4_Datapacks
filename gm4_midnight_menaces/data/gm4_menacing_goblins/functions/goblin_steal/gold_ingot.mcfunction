# steals a gold ingot from the player
# @s = goblin if there are nearby players with gold ingots
# located at @s
# run from goblin_steal/check_player

# get current gold ingot count
execute store result score count gm4_menace_data run data get entity @s ArmorItems[2].Count

# take 1 gold ingot from player
clear @a[tag=gm4_goblin_target,limit=1,distance=..3] gold_ingot 1

# store gold ingots at chest slot
execute if score count gm4_menace_data matches 0 run data modify entity @s ArmorItems[2] set value {id:"minecraft:gold_ingot",Count:1b}
execute if score count gm4_menace_data matches 1..63 if predicate gm4_menacing_goblins:store_chance store result entity @s ArmorItems[2].Count byte 1 run scoreboard players add count gm4_menace_data 1

# show that it got stolen
data modify entity @s HandItems[1] set value {id:"minecraft:gold_ingot",Count:1b}
playsound minecraft:entity.zombie.ambient hostile @a[distance=..5] ~ ~ ~ 0.2 2
playsound minecraft:entity.witch.celebrate hostile @a[distance=..5] ~ ~ ~ 1 2
playsound minecraft:block.chain.break hostile @a[distance=..5] ~ ~ ~ 2 2
particle block minecraft:gold_block ~ ~ ~ 0 0 0 1 15 force

# mark full inventory with tag (to prevent continuous data checks)
execute if score count gm4_menace_data matches 64.. run tag @s add gm4_goblin_gold_full

# clear scores
scoreboard players reset count gm4_menace_data
