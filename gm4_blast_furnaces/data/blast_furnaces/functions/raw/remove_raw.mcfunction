# Called from mark_*
# @s = valid smeltery at the furnace with item but no wrong tag

# OR

# Called from raw/remove.mcfunction
# @s = @e[tag=gm4_bf_output, tag=!gm4_bf_has_structure, tag=gm4_bf_has_raw]



tag @s remove gm4_bf_raw_iron
tag @s remove gm4_bf_raw_gold
tag @s remove gm4_bf_raw_sand
tag @s remove gm4_bf_raw_rsand
tag @s remove gm4_bf_raw_chorus
