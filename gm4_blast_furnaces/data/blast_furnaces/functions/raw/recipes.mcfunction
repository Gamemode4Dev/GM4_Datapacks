# Called from #validate_recipe from check_recipes
# @s = valid structure at furnace

execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run function blast_furnaces:raw/iron
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run function blast_furnaces:raw/gold
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:sand"}]} run function blast_furnaces:raw/sand
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:red_sand"}]} run function blast_furnaces:raw/red_sand
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:chorus_fruit"}]} run function blast_furnaces:raw/chorus
