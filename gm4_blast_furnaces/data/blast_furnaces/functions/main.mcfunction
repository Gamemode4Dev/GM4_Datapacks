#look for cooking furnaces
#@s = blast furnace aec

execute if block ~1 ~ ~ furnace[lit=true] run scoreboard players set @s gm4_bf_dir 0
execute if block ~-1 ~ ~ furnace[lit=true] run scoreboard players set @s gm4_bf_dir 2
execute if block ~ ~ ~1 furnace[lit=true] run scoreboard players set @s gm4_bf_dir 1
execute if block ~ ~ ~-1 furnace[lit=true] run scoreboard players set @s gm4_bf_dir 3
execute as @s[scores={gm4_bf_dir=0}] store result score @s gm4_bf_data run data get block ~1 ~ ~ CookTime
execute as @s[scores={gm4_bf_dir=1}] store result score @s gm4_bf_data run data get block ~ ~ ~1 CookTime
execute as @s[scores={gm4_bf_dir=2}] store result score @s gm4_bf_data run data get block ~-1 ~ ~ CookTime
execute as @s[scores={gm4_bf_dir=3}] store result score @s gm4_bf_data run data get block ~ ~ ~-1 CookTime
execute unless entity @e[tag=gm4_blast_furnace,scores={gm4_bf_data=183..}] run scoreboard players set blast_furnace_cooking gm4_bf_data 0
execute if score @s gm4_bf_data matches 183.. run scoreboard players set blast_furnace_cooking gm4_bf_data 1
