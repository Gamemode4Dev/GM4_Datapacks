# Called from handle_smelting.mcfunction
# @s = @e[tag=gm4_bf_output, tag=gm4_bf_has_furnace, tag=gm4_bf_has_structure, tag=!gm4_bf_temp, tag=gm4_bf_has_ore]

# OR

# Called from update.mcfunction
# @s = @e[tag=gm4_bf_output, tag=!gm4_bf_has_structure, tag=gm4_bf_has_ore]



tag @s remove gm4_bf_ore_iron
tag @s remove gm4_bf_ore_gold
tag @s remove gm4_bf_has_ore

data merge entity @s {ArmorItems:[{},{},{},{}]}
