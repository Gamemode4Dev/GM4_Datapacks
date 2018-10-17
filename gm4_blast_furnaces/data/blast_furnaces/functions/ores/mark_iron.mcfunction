# Called from ores/iron.mcfunction

# @s = @e[tag=gm4_bf_output, tag=gm4_bf_has_furnace, tag=gm4_bf_has_structure, tag=!gm4_bf_ore_iron]
#			if block ^ ^ ^1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]}



data merge entity @s {ArmorItems:[{},{},{},{id:"iron_ore",Count:1b}],DisabledSlots:2039583}
tag @s add gm4_bf_ore_iron
tag @s add gm4_bf_has_ore
