# Called from #validate_recipe from check_recipes
# @s = valid structure at furnace

execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run function blast_furnaces:ores/iron
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run function blast_furnaces:ores/gold
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:sand"}]} run function blast_furnaces:ores/sand
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:red_sand"}]} run function blast_furnaces:ores/red_sand
execute if block ~ ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:chorus_fruit"}]} run function blast_furnaces:ores/chorus
