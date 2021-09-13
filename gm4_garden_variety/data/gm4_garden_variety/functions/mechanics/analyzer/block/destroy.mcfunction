# processes the analyzer that has been broken
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:mechanics/analyzer/process


# give back items
loot spawn ~ ~.6 ~ loot gm4_garden_variety:blocks/analyzer

# visuals
particle block piston ~ ~1 ~ .1 .25 .1 .05 30 normal @a

# kill analyzer
kill @s