# @s = an iron ingot item stack on a tinkering compressor
# at @tinkering compressor positioned ~ ~0.9 ~
# run from tinkering_compressors:mode/decompress

# set fake player flag
scoreboard players set ran_compressor gm4_tc_data 1

# tinker operation
execute store result score #item_count gm4_tc_data run data get entity @s Item.Count 1

scoreboard players operation #items gm4_tc_data = #item_count gm4_tc_data
scoreboard players operation #items gm4_tc_data *= #9stack gm4_tc_data

scoreboard players operation #stack gm4_tc_data = #items gm4_tc_data
scoreboard players operation #remainder gm4_tc_data = #items gm4_tc_data

scoreboard players operation #stack gm4_tc_data /= #64stack gm4_tc_data
scoreboard players operation #remainder gm4_tc_data %= #64stack gm4_tc_data

execute if score #stack gm4_tc_data matches 1..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 2..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 3..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 4..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 5..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 6..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 7..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 8..9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 9 at @s run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:64b},Tags:["gm4_tc_locked"]}

execute if score #remainder gm4_tc_data matches 1.. run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_ingot",Count:1b},Tags:["gm4_tc_remainder","gm4_tc_locked"]}
execute if score #remainder gm4_tc_data matches 1.. store result entity @e[type=item,tag=gm4_tc_remainder,limit=1] Item.Count byte 1 run scoreboard players get #remainder gm4_tc_data
tag @e[type=item,tag=gm4_tc_remainder] remove gm4_tc_remainder

execute if score #items gm4_tc_data matches 1.. run playsound minecraft:block.piston.extend block @a[distance=..5] ~ ~ ~

kill @s
