# Called from mark_*
# @s = valid smeltery at the furnace with item but no wrong tag

# OR

# Called from ores/remove.mcfunction
# @s = @e[tag=gm4_bf_output, tag=!gm4_bf_has_structure, tag=gm4_bf_has_ore]



tag @s remove gm4_bf_ore_iron
tag @s remove gm4_bf_ore_gold
tag @s remove gm4_bf_ore_sand
tag @s remove gm4_bf_ore_rsand
tag @s remove gm4_bf_ore_chorus
