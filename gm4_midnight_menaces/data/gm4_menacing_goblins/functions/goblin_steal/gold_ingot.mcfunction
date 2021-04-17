# @s = goblin if there are nearby players with gold ingots
# run from goblin_steal/check_player

# take 1 gold ingot from player
clear @p[tag=gm4_goblin_target] gold_ingot 1

# store gold ingots at chest slot
execute store result score count gm4_menace_data run data get entity @s ArmorItems[2].Count
execute if score count gm4_menace_data matches 0 run data modify entity @s ArmorItems[2] set value {id:"minecraft:gold_ingot",Count:1b}
execute if score count gm4_menace_data matches 1.. run function gm4_menacing_goblins:goblin_steal/add_count

# show that it got stolen
data modify entity @s HandItems[1] set value {id:"minecraft:gold_ingot",Count:1b}
playsound minecraft:entity.zombie.ambient hostile @a[distance=..5] ~ ~ ~ 0.2 2
playsound minecraft:entity.witch.celebrate hostile @a[distance=..5] ~ ~ ~ 1 2
playsound minecraft:block.chain.break hostile @a[distance=..5] ~ ~ ~ 2 2
particle block minecraft:gold_block ~ ~ ~ 0 0 0 1 15 force

# clear scores
scoreboard players reset count gm4_menace_data
