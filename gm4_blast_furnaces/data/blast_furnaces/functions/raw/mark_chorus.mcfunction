# Called from raw/chorus.mcfunction
# @s = valid smeltery at the furnace with chorus but no tag


execute if entity @s[tag=gm4_bf_has_raw] run function #blast_furnaces:clear_recipe
data merge entity @s {ArmorItems:[{},{},{},{id:"chorus_plant",Count:1b}],DisabledSlots:2039583}
tag @s add gm4_bf_raw_chorus
tag @s add gm4_bf_has_raw
