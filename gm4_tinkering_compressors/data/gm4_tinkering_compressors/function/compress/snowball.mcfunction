# @s = a snowball item stack on a tinkering compressor
# at @tinkering compressor positioned ~ ~0.9 ~
# run from tinkering_compressors:mode/compress

# set fake player flag
scoreboard players set $ran_compressor gm4_tc_data 1

# tinker operation
execute store result score #item_count gm4_tc_data run data get entity @s Item.count 1

scoreboard players operation #stack gm4_tc_data = #item_count gm4_tc_data
scoreboard players operation #remainder gm4_tc_data = #item_count gm4_tc_data

scoreboard players operation #stack gm4_tc_data /= #4stack gm4_tc_data
scoreboard players operation #remainder gm4_tc_data %= #4stack gm4_tc_data

execute if score #stack gm4_tc_data matches 1.. at @s run summon item ~ ~ ~ {Item:{id:"minecraft:snow_block",count:1},Tags:["gm4_tc_stack","gm4_tc_locked"]}
execute if score #stack gm4_tc_data matches 1.. store result entity @e[type=item,tag=gm4_tc_stack,limit=1] Item.count byte 1 run scoreboard players get #stack gm4_tc_data
execute if score #stack gm4_tc_data matches 1.. run playsound minecraft:block.piston.contract block @a[distance=..5] ~ ~ ~
tag @e[type=item,tag=gm4_tc_stack] remove gm4_tc_stack

execute if score #remainder gm4_tc_data matches 1.. store result entity @s Item.count byte 1 run scoreboard players get #remainder gm4_tc_data
execute if score #remainder gm4_tc_data matches 1.. run data merge entity @s {Tags:["gm4_tc_locked"],PickupDelay:0s}
execute if score #remainder gm4_tc_data matches 0 run kill @s
