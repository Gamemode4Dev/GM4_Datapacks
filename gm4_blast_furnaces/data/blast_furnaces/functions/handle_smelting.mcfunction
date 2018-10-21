# Called from check_structure.mcfunction
# @s = @e[tag=gm4_bf_output, tag=gm4_bf_has_furnace, tag=gm4_bf_has_structure]

# =========== MARK ADN DISPLAY ORE IFF IRON OR GOLD IS SMELTING ==========
execute if block ^ ^ ^1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run function blast_furnaces:ores/iron
execute if block ^ ^ ^1 furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run function blast_furnaces:ores/gold
execute if entity @s[tag=!gm4_bf_temp, tag=gm4_bf_has_ore] run function blast_furnaces:ores/remove
tag @s remove gm4_bf_temp
