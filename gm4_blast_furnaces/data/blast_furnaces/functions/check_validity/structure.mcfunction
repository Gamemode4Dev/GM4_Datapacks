#@s = blast furnace that's finished smelting something
#run from check_validity/1..3


scoreboard players set @s gm4_bf_data 0
#check iron block count
execute store result score @s gm4_bf_data run clone ~-1 ~ ~-1 ~1 ~1 ~1 ~-1 ~ ~-1 filtered iron_block force
#check furnace orientation
execute if score @s gm4_bf_dir matches 0 if block ~1 ~ ~ furnace[facing=east] unless block ~1 ~1 ~ iron_block run scoreboard players add @s gm4_bf_data 10
execute if score @s gm4_bf_dir matches 1 if block ~ ~ ~1 furnace[facing=south] unless block ~ ~1 ~1 iron_block run scoreboard players add @s gm4_bf_data 10
execute if score @s gm4_bf_dir matches 2 if block ~-1 ~ ~ furnace[facing=west] unless block ~-1 ~1 ~ iron_block run scoreboard players add @s gm4_bf_data 10
execute if score @s gm4_bf_dir matches 3 if block ~ ~ ~-1 furnace[facing=north] unless block ~ ~1 ~-1 iron_block run scoreboard players add @s gm4_bf_data 10

execute if score @s gm4_bf_data matches 24 if score @s gm4_bf_ore matches 1 if block ~ ~1 ~ air run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:iron_ingot",Count:1b},PickupDelay:50s}
execute if score @s gm4_bf_data matches 24 if score @s gm4_bf_ore matches 2 if block ~ ~1 ~ air run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:gold_ingot",Count:1b},PickupDelay:50s}
