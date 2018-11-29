# Called from raw/iron.mcfunction
# @s = valid smeltery at the furnace with iron but no tag


execute if entity @s[tag=gm4_bf_has_raw] run function #blast_furnaces:clear_recipe
data merge entity @s {ArmorItems:[{},{},{},{id:"iron_ore",Count:1b}],DisabledSlots:2039583}
tag @s add gm4_bf_raw_iron
tag @s add gm4_bf_has_raw
