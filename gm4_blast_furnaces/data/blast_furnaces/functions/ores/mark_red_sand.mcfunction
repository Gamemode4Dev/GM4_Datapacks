# Called from ores/red_sand.mcfunction
# @s = valid smeltery at the furnace with red sand but no tag


execute if entity @s[tag=gm4_bf_has_ore] run function #blast_furnaces:clear_recipe
data merge entity @s {ArmorItems:[{},{},{},{id:"red_sand",Count:1b}],DisabledSlots:2039583}
tag @s add gm4_bf_ore_rsand
tag @s add gm4_bf_has_ore
